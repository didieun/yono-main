package com.mmk.dao;

import java.util.List;

import com.mmk.entity.UserCardEntity;
import com.mmk.entity.UserEntity;

public interface UserCardDAO {
    void registerCard(UserCardEntity userCardEntity);

    // 카드 넘버는 고유해야함
    boolean existsByUserCardNum(String userCardNum);

    // userNum 로 모든 카드 조회
    List<UserCardEntity> getAllCardsByUserNum(int userNum);

    // userNum 로 모든 카드 조회 (카드 혜택, 정보 포함)
    List<UserCardEntity> getAllCardsInfoByUserNum(int userNum);

    void removePrimaryCardAll(int userNum);

    void setPrimaryCard(int userCardId);

    UserCardEntity findByUserNumAndPrimaryCard(UserEntity userEntity, String primaryCard);

    UserCardEntity findByUserCardId(int userCardId);

    // void updateAllByUserNumAndOrganization(int userNum, String organization,
    // String companyId, String companyPwd, String connectedId);
}