package org.yami.image.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;
import org.yami.image.dto.Image;

@Mapper
public interface ImageDao {

  @Insert("INSERT INTO images(image_id, target_id, path) VALUES(#{imageId}, #{targetId}, #{path})")
  @Transactional
  int saveImage(Image image);
}
