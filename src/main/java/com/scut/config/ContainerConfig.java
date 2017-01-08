package com.scut.config;

import org.springframework.boot.context.embedded.*;
import org.springframework.context.annotation.*;
import org.springframework.http.*;

/**
 * Created by pc on 2017/1/7.
 */
@Configuration
public class ContainerConfig {
    @Bean
    public EmbeddedServletContainerCustomizer containerCustomizer(){
        return new MyCustomizer();
    }

    private static class MyCustomizer implements EmbeddedServletContainerCustomizer {
        @Override
        public void customize(ConfigurableEmbeddedServletContainer container) {
            container.addErrorPages(new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/500"));
            container.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND,"/404"));
        }
    }
}