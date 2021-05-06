package com.kreva.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.jdbc.JdbcDaoImpl;

import javax.sql.DataSource;

@Configuration
public class AuthenticationProviderConfig {

    @Autowired
    private DataSource dataSource;

    @Bean(name = "userDetailService")
    public UserDetailsService userDetailsService() {
        JdbcDaoImpl jdbcDao = new JdbcDaoImpl();
        jdbcDao.setDataSource(dataSource);
        jdbcDao.setUsersByUsernameQuery("select username, password, 'true' as enabled from users where username=?");
        jdbcDao.setAuthoritiesByUsernameQuery(
                "select b.username, c.name " +
                "from user_roles a, users b, roles c" +
                        " where b.username=? and a.user_id=b.id and a.role_id=c.id");

        return jdbcDao;
    }
}
