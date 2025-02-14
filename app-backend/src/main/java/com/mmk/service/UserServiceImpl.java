package com.mmk.service;

import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

// import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.mmk.dao.UserDAO;
import com.mmk.dto.UserDTO;
import com.mmk.entity.UserEntity;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    // private final BCryptPasswordEncoder passwordEncoder = new
    // BCryptPasswordEncoder();

    @Override
    public UserDTO createUser(UserDTO userDTO) {
        if (userDAO.existsByUserId(userDTO.getUserId())) {
            throw new IllegalArgumentException("이미 존재하는 아이디입니다.");
        }

        // 비밀번호 암호화
        // String encodedPassword = passwordEncoder.encode(userDTO.getPassword());
        // userDTO.setPassword((encodedPassword));

        UserEntity userEntity = toEntity(userDTO);
        userDAO.createUser(userEntity);
        return toDTO(userEntity);
    }

    @Override
    public UserDTO findByUserNum(int userNum) {
        UserEntity userEntity = userDAO.findByUserNum(userNum);
        return toDTO(userEntity);
    }

    @Override
    public UserEntity findEntityByUserNum(int userNum) {
        UserEntity userEntity = userDAO.findByUserNum(userNum);
        return userEntity;
    }

    @Override
    public UserDTO getUserByUserId(String userId) {
        UserEntity userEntity = userDAO.getUserByUserId(userId);
        return toDTO(userEntity);
    }

    @Override
    public UserEntity findByUserId(String userId) {
        UserEntity userEntity = userDAO.getUserByUserId(userId);
        if (userEntity == null) {
            throw new NoSuchElementException("아이디 " + userId + "에 해당하는 사용자가 없습니다.");
        }
        return userEntity;
    }

    @Override
    public UserDTO getUserByEmail(String email) {
        UserEntity userEntity = userDAO.getUserByEmail(email);
        return toDTO(userEntity);
    }

    @Override
    public List<UserDTO> getAllUsers() {
        List<UserEntity> userEntities = userDAO.getAllUsers();
        if (userEntities.isEmpty()) {
            throw new NoSuchElementException("현재 등록된 유저가 없습니다.");
        }
        return userEntities.stream().map(this::toDTO).collect(Collectors.toList());
    }

    @Override
    public void deleteUser(int userNum) {
        UserDTO userDTO = toDTO(userDAO.findByUserNum(userNum));
        userDTO.setState("INACTIVE");
        userDAO.updateUser(toEntity(userDTO));
    }

    @Override
    public boolean existsByUserId(String userId) {
        return userDAO.existsByUserId(userId);
    }

    @Override
    public boolean existsByEmail(String email) {
        return userDAO.existsByEmail(email);
    }

    @Override
    public boolean existByName(String name) {
        return userDAO.existsByName(name);
    }

    public boolean validateLogin(String userId, String password) {
        UserEntity userEntity = userDAO.getUserByUserId(userId);

        if (userEntity != null && userEntity.getPassword().equals(password)) {
            return true;
        }

        // if (userEntity != null) {
        // return passwordEncoder.matches(password, userEntity.getPassword());
        // }

        return false;
    }

    @Override
    public void updateUser(UserDTO userDTO) {
        UserEntity ue = toEntity(userDTO);
        userDAO.updateUser(ue);
    }

    @Override
    public UserDTO getFindId(String name, String email) {
        UserEntity ue = userDAO.getFindId(name, email);
        UserDTO result = toDTO(ue);
        return result;
    }

    @Override
    public UserDTO getFindPwd(String name, String email, String id) {
        UserEntity ue = userDAO.getFindPwd(name, email, id);
        UserDTO result = toDTO(ue);
        return result;
    }

    // DTO → Entity 변환
    private UserEntity toEntity(UserDTO dto) {
        UserEntity entity = new UserEntity();
        entity.setUserNum(dto.getUserNum());
        entity.setUserId(dto.getUserId());
        entity.setPassword(dto.getPassword());
        entity.setEmail(dto.getEmail());
        entity.setName(dto.getName());
        entity.setSpendingTarget(dto.getSpendingTarget());
        entity.setProfile(dto.getProfile());
        entity.setCreatedAt(dto.getCreatedAt());
        entity.setUpdatedAt(dto.getUpdatedAt());
        entity.setState(dto.getState());
        entity.setUserRole(dto.getUserRole());
        return entity;
    }

    // Entity → DTO 변환
    private UserDTO toDTO(UserEntity entity) {
        if (entity != null) {
            UserDTO dto = new UserDTO();
            dto.setUserNum(entity.getUserNum());
            dto.setUserId(entity.getUserId());
            dto.setPassword(entity.getPassword());
            dto.setEmail(entity.getEmail());
            dto.setName(entity.getName());
            dto.setSpendingTarget(entity.getSpendingTarget());
            dto.setProfile(entity.getProfile());
            dto.setCreatedAt(entity.getCreatedAt());
            dto.setUpdatedAt(entity.getUpdatedAt());
            dto.setState(entity.getState());
            dto.setUserRole(entity.getUserRole());
            return dto;
        } else {
            return null;
        }
    }

    @Override
    public ArrayList<Integer> findAllUserNum() {
        List<UserEntity> users = userDAO.findAll();
        return users.stream()
                    .map(UserEntity::getUserNum)
                    .collect(Collectors.toCollection(ArrayList::new));
    }

}
