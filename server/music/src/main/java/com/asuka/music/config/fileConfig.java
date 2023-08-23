package com.asuka.music.config;


import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

// 定位文件资源地址
@Configuration
public class fileConfig implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        //歌手头像地址
        registry.addResourceHandler("/img/singerPic/**").addResourceLocations(
            "file:"+ System.getProperty("user.dir")+System.getProperty("file.separator")+
             "img"+System.getProperty("file.separator")+"singerPic"+System.getProperty("file.separator")
        );
        // 歌曲封面地址
        registry.addResourceHandler("/img/songPic/**").addResourceLocations(
                "file:"+ System.getProperty("user.dir")+System.getProperty("file.separator")+
                        "img"+System.getProperty("file.separator")+"songPic"+System.getProperty("file.separator")
        );
        // 歌单封面地址
        registry.addResourceHandler("/img/songListPic/**").addResourceLocations(
                "file:"+ System.getProperty("user.dir")+System.getProperty("file.separator")+
                        "img"+System.getProperty("file.separator")+"songListPic"+System.getProperty("file.separator")
        );
        // 歌曲地址
        registry.addResourceHandler("/song/**").addResourceLocations(
                "file:"+ System.getProperty("user.dir")+System.getProperty("file.separator")+"song"+System.getProperty(
                        "file.separator")
        );
        //前端用户头像地址
        registry.addResourceHandler("/avatorImg/**").addResourceLocations(
                "file:"+ System.getProperty("user.dir")+System.getProperty("file.separator")+
                        "avatorImg"+System.getProperty("file.separator")
        );
        //前端用户头像默认地址
        registry.addResourceHandler("/img/**").addResourceLocations(
                "file:"+ System.getProperty("user.dir")+System.getProperty("file.separator")+
                        "img"+System.getProperty("file.separator")
        );
    }
}
