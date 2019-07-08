package com.fse.user.dao;

import com.fse.user.model.User;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;

@Repository
public class UserDAOImpl implements UserDAO {

    private static final Logger logger = Logger.getLogger(UserDAOImpl.class);

    @Autowired
    private DataSource dataSource;

    @Bean
    public JdbcTemplate getJdbcTemplate() {
        return new JdbcTemplate(dataSource);
    }

    @Override
    public User findUserByUsernameAndPassword(String username, String password) {

        logger.info("Register user sql command: SELECT * FROM users where username=" + username + " and password=" + password);
        return (User) getJdbcTemplate().query("SELECT * FROM users where username=? and password=?",
                new Object[]{username, password}, new UserRowMapper())
                .stream().findFirst().orElse(null);
    }

    @Override
    public void registerNewUser(User user) {
        String sql = "INSERT INTO users " +
                "(name, username, password, email) VALUES (?, ?, ?, ?)";

        logger.info("Register user sql command:" + sql);

        getJdbcTemplate().update(sql, new Object[]{user.getName(), user.getUsername(),
                user.getPassword(), user.getEmail()});
    }

    @Override
    public int updateUserDetails(User user) {
        String SQL = "UPDATE users SET name = ?, password = ?, email = ? WHERE username = ?";

        logger.info("Update user sql command:" + SQL);
        return getJdbcTemplate().update(SQL, user.getName(), user.getPassword(), user.getEmail(), user.getUsername());
    }

    private class UserRowMapper implements RowMapper {
        @Override
        public User mapRow(ResultSet rs, int rowNum) throws SQLException {
            User userDetails = new User();
            userDetails.setName(rs.getString("name"));
            userDetails.setUsername(rs.getString("username"));
            userDetails.setEmail(rs.getString("email"));
            userDetails.setPassword(rs.getString("password"));
            return userDetails;
        }
    }
}