package com.example.buysell.services;

import com.example.buysell.models.User;
import com.example.buysell.models.enums.Role;
import com.example.buysell.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;
import java.util.Set;

@Service
@Slf4j
@RequiredArgsConstructor
public class



UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    @Transactional
    public boolean createUser(User user) {
        String email = user.getEmail();
        if (userRepository.findByEmail(email) != null) {
            log.info("User registration attempted with existing email: {}", email);
            return false;  // Пользователь с таким email уже существует
        }
        user.setActive(true);
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        user.getRoles().clear();
        user.getRoles().add(Role.ROLE_ADMIN);
        log.info("Assigning admin role to new user with email: {}", email);

        userRepository.save(user);
        log.info("New user registered with email: {}", email);
        return true;
    }

    public List<User> list() {
        return userRepository.findAll();
    }

    public User findUserById(Long id) {
        return userRepository.findById(id).orElse(null);
    }

    @Transactional
    public void changeUserRoles(User user, Set<Role> newRoles) {
        user.getRoles().clear();
        user.getRoles().addAll(newRoles);
        userRepository.save(user);
        log.info("Updated roles for user with email: {}", user.getEmail());
    }

    @Transactional
    public void banUser(Long id) {
        userRepository.findById(id).ifPresent(user -> {
            user.setActive(!user.isActive());
            log.info("{} user with id = {}; email: {}", user.isActive() ? "Unbanned" : "Banned", user.getId(), user.getEmail());
            userRepository.save(user);
        });
    }
}
