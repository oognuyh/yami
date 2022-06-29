package org.yami.common.configuration;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.oauth2.client.CommonOAuth2Provider;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.client.registration.InMemoryClientRegistrationRepository;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.yami.common.security.AjaxAwareLoginUrlAuthenticationEntryPoint;
import org.yami.common.security.SocialService;
import org.yami.user.dao.UserDao;
import org.yami.user.dto.LoginType;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
@PropertySource("classpath:application.properties")
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

  private final UserDao userDao;

  private final Environment environment;

  private final SocialService socialService;

  private final List<String> clients = Arrays.asList("github");

  private final AuthenticationSuccessHandler authenticationSuccessHandler;

  private final PasswordEncoder passwordEncoder;

  @Bean
  public AjaxAwareLoginUrlAuthenticationEntryPoint ajaxAwareLoginUrlAuthenticationEntryPoint() {
    return new AjaxAwareLoginUrlAuthenticationEntryPoint("/login");
  }

  @Override
  protected void configure(HttpSecurity http) throws Exception {
    http.httpBasic()
        .disable()
        .csrf()
        .disable()
        .formLogin()
        .loginPage("/login")
        .loginProcessingUrl("/login")
        .successHandler(authenticationSuccessHandler)
        .and()
        .logout()
        .logoutSuccessUrl("/login")
        .and()
        .exceptionHandling()
        .authenticationEntryPoint(ajaxAwareLoginUrlAuthenticationEntryPoint());

    http.oauth2Login()
        .loginPage("/login")
        .successHandler(authenticationSuccessHandler)
        .clientRegistrationRepository(clientRegistrationRepository())
        .userInfoEndpoint()
        .userService(socialService);

    http.authorizeRequests()
        .antMatchers("/register/**", "/login/**", "/oauth2/**")
        .permitAll()
        .antMatchers(HttpMethod.GET, "/api/categories", "/", "/product/**")
        .permitAll()
        .anyRequest()
        .authenticated();

    http.addFilterBefore(new CharacterEncodingFilter("utf-8", true), CsrfFilter.class);
  }

  @Override
  public void configure(WebSecurity web) throws Exception {
    web.ignoring().antMatchers("/h2-console/**", "/resources/**", "/webjars/**");
  }

  @Override
  protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    auth.userDetailsService(
            (email) ->
                userDao
                    .findUserByEmailAndLoginType(email, LoginType.LOCAL)
                    .orElseThrow(() -> new UsernameNotFoundException("이메일 및 비밀번호가 유효하지 않습니다.")))
        .passwordEncoder(passwordEncoder);
  }

  private ClientRegistration getRegistration(String client) {
    String clientId =
        environment.getProperty(
            "spring.security.oauth2.client.registration." + client + ".client-id");
    if (clientId == null) {
      return null;
    }

    String clientSecret =
        environment.getProperty(
            "spring.security.oauth2.client.registration." + client + ".client-secret");
    if (client.equalsIgnoreCase("github")) {
      return CommonOAuth2Provider.GITHUB
          .getBuilder(client)
          .clientId(clientId)
          .clientSecret(clientSecret)
          .build();
    }

    return null;
  }

  @Bean
  public ClientRegistrationRepository clientRegistrationRepository() {
    List<ClientRegistration> registrations =
        clients.stream()
            .map(c -> getRegistration(c))
            .filter(registration -> registration != null)
            .collect(Collectors.toList());

    return new InMemoryClientRegistrationRepository(registrations);
  }
}
