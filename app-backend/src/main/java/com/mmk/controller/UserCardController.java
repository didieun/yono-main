package com.mmk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mmk.common.ApiResponse;
import com.mmk.dto.UserCardDTO;
import com.mmk.service.UserCardService;

@RestController
@RequestMapping("/card")
public class UserCardController {

    @Autowired
    private UserCardService userCardService;

    // 특정 사용자의 보유 카드 조회
    @GetMapping("/user/{userNum}")
    public ResponseEntity<ApiResponse<List<UserCardDTO>>> getAllCardsByUserNum(@PathVariable int userNum) {
        List<UserCardDTO> userCards = userCardService.getAllCardsByUserNum(userNum);
        if (userCards.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(new ApiResponse<>(404, "해당 사용자가 보유한 카드가 없습니다.", null));
        }
        return ResponseEntity.ok(new ApiResponse<>(200, "사용자 보유 카드조회 성공", userCards));
    }

    // 특정 사용자의 보유 카드 조회 (마스터 카드 정보, 혜택 포함)
    @GetMapping("/user/{userNum}/details")
    public ResponseEntity<ApiResponse<List<UserCardDTO>>> getAllCardsInfoByUserNum(@PathVariable int userNum) {
        List<UserCardDTO> userCards = userCardService.getAllCardsInfoByUserNum(userNum);
        if (userCards.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NO_CONTENT)
                    .body(new ApiResponse<>(204, "해당 사용자가 보유한 카드가 없습니다.", null));
        }
        return ResponseEntity.ok(new ApiResponse<>(200, "사용자 보유 카드조회 성공", userCards));
    }

    // 사용자 카드 등록
    @PostMapping("/register")
    public ResponseEntity<ApiResponse<UserCardDTO>> registerUserCard(@RequestBody UserCardDTO userCardDTO,
            @RequestParam String organization, @RequestParam String cardTitle) {
        try {
            UserCardDTO savedCard = userCardService.registerCard(userCardDTO, organization, cardTitle);
            if (savedCard == null) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND)
                        .body(new ApiResponse<>(404, "등록되어 있지 않은 카드사입니다.", null));
            } else {
                ApiResponse<UserCardDTO> response = new ApiResponse<>(200, "카드등록 성공", savedCard);
                return ResponseEntity.status(HttpStatus.CREATED).body(response);
            }
        } catch (Exception e) {
            ApiResponse<UserCardDTO> response = new ApiResponse<>(201, e.getMessage(), null);
            return ResponseEntity.status(HttpStatus.CREATED).body(response);
        }
    }

    // 대표카드 설정
    @GetMapping("/setPrimaryCard")
    public ResponseEntity<ApiResponse<UserCardDTO>> setPrimaryCard(@RequestParam("userCardId") int userCardId,
            @RequestParam("userNum") int userNum) {

        try {
            UserCardDTO userCardDTO = userCardService.setPrimaryCard(userCardId,
                    userNum);
            ApiResponse<UserCardDTO> response = new ApiResponse<>(200, "대표카드 등록성공",
                    userCardDTO);
            return ResponseEntity.status(HttpStatus.CREATED).body(response);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(new ApiResponse<>(404, "대표카드 등록실패.", null));
        }
    }

    // 로그인 유저의 대표카드의 카드 조회
    @GetMapping("/primaryCard")
    public ResponseEntity<ApiResponse<UserCardDTO>> getPrimaryCard(@RequestParam("userNum") int userNum) {
        try {
            UserCardDTO userCardDTO = userCardService.findPrimaryCardByUserNum(userNum);
            if (userCardDTO != null) {
                return ResponseEntity.ok(new ApiResponse<>(200, "대표카드의 카드 정보 조회 성공", userCardDTO));
            } else {
                return ResponseEntity.noContent().build();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ApiResponse<>(500, "대표카드 조회 중 오류 발생", null));
        }
    }

}
