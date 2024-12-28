import React, { useState } from 'react';
import styled from 'styled-components';
import CommonRoot from '../../common/CommonRoot';
import CommonInput from '../../common/CommonInput';
import CommonButton from '../../common/CommonButton';
import CommonHr from '../../common/CommonHr';
import CommonPageInfo from '../../common/CommonPageInfo';

import SearchAddressDialog from './modal/SearchAddressDialog';

import { checkUserIdExists, signUpUser } from '../../apis/userApi';
import {
  EMAIL_REGEX_ERROR,
  EMPTY_ADDRESS_ERROR,
  EMPTY_EMAIL_ERROR,
  EMPTY_NAME_ERROR,
  EMPTY_PASSWORD_ERROR,
  EMPTY_USERID_ERROR,
  NAME_REGEX_ERROR,
  PASSWORD_MISMATCH_ERROR,
  PASSWORD_REGEX_ERROR,
  SERVER_ERROR,
  USERID_AVAILABLE_MESSAGE,
  USERID_DUPLICATE_ERROR,
  USERID_REGEX_ERROR,
  USERID_VERIFY_PROMPT,
} from '../../common/Message';
import ValidationMessage from '../../common/ValidationMessage';
import CommonDialog from '../../common/CommonDialog';
import { useNavigate } from 'react-router-dom';

const FullContainer = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
`;

const MiddleContainer = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: flex-start;
`;

const ContainerProps = {
  marginBottom: '13px',
};

const InputProps = {
  width: '350px',
  $borderColor: 'transparent',
  background: 'transparent',
  $focusBorderColor: 'transparent',
  $marginLeft: '10px',
};

const InputUserIdBox = styled.div`
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: flex-end;
  width: 350px;

  & > *:not(:last-child) {
    margin-right: 10px;
  }
`;

const ButtonProps = {
  width: '73px',
  height: '37px',
};

const FORM_FIELDS = {
  userId: {
    placeholder: '아이디를 입력하세요.',
    text: '아이디',
    type: 'text',
    errorMessage: {
      empty: EMPTY_USERID_ERROR,
      invalid: USERID_REGEX_ERROR,
      duplicate: USERID_DUPLICATE_ERROR,
      available: USERID_AVAILABLE_MESSAGE,
      verifyPrompt: USERID_VERIFY_PROMPT,
    },
  },
  password: {
    placeholder: '비밀번호를 입력하세요.',
    text: '비밀번호',
    type: 'password',
    errorMessage: {
      empty: EMPTY_PASSWORD_ERROR,
      invalid: PASSWORD_REGEX_ERROR,
    },
  },
  confirmPassword: {
    placeholder: '비밀번호를 다시 입력하세요.',
    text: '비밀번호 확인',
    type: 'password',
    errorMessage: {
      mismatch: PASSWORD_MISMATCH_ERROR,
    },
  },
  name: {
    placeholder: '이름을 입력하세요.',
    text: '이름',
    type: 'text',
    errorMessage: {
      empty: EMPTY_NAME_ERROR,
      invalid: NAME_REGEX_ERROR,
    },
  },
  email: {
    placeholder: '이메일을 입력하세요.',
    text: '이메일',
    type: 'email',
    errorMessage: {
      empty: EMPTY_EMAIL_ERROR,
      invalid: EMAIL_REGEX_ERROR,
    },
  },
  address: {
    placeholder: '주소를 입력하세요.',
    text: '주소',
    type: 'text',
    errorMessage: {
      empty: EMPTY_ADDRESS_ERROR,
    },
  },
};

export function SignUp() {
  const [isSignUpSuccessVisible, setIsSignUpSuccessVisible] = useState(false);
  const [isSignUpFailVisible, setIsSignUpFailVisible] = useState(false);
  const [isAddressModalOpen, setIsAddressModalOpen] = useState(false);
  const [isUserIdValidated, setIsUserIdValidated] = useState(false);

  const [formData, setFormData] = useState({
    userId: '',
    password: '',
    confirmPassword: '',
    name: '',
    email: '',
    address: '',
  });

  const [formMessage, setFormMessage] = useState({
    userId: '',
    password: '',
    confirmPassword: '',
    name: '',
    email: '',
    address: '',
  });

  const inputRegexs = {
    userId: /^[a-z][a-z0-9]{3,15}$/,
    email: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/,
    password: /^(?=.*[a-z])(?=.*\d)(?=.*[*@#$%^&+=!]).{8,}$/,
    name: /^[가-힣]{2,10}$/,
  };

  const navigate = useNavigate();

  const handleInputChange = (e, field) => {
    setFormData((prev) => ({ ...prev, [field]: e.target.value }));
    setFormMessage((prev) => ({ ...prev, [field]: '' }));
  };

  const validateForm = () => {
    const errors = {};

    Object.keys(FORM_FIELDS).forEach((field) => {
      if (!formData[field]) {
        errors[field] = FORM_FIELDS[field].errorMessage.empty;
      } else if (field === 'name' && !inputRegexs.name.test(formData.name)) {
        errors[field] = FORM_FIELDS.name.errorMessage.invalid;
      } else if (field === 'email' && !inputRegexs.email.test(formData.email)) {
        errors[field] = FORM_FIELDS.email.errorMessage.invalid;
      } else if (
        field === 'password' &&
        !inputRegexs.password.test(formData.password)
      ) {
        errors[field] = FORM_FIELDS.password.errorMessage.invalid;
      } else if (
        field === 'userId' &&
        !inputRegexs.userId.test(formData.userId)
      ) {
        errors[field] = FORM_FIELDS.userId.errorMessage.invalid;
      }
    });

    if (formData.password !== formData.confirmPassword) {
      errors.confirmPassword =
        FORM_FIELDS.confirmPassword.errorMessage.mismatch;
    }

    return errors;
  };

  // 아이디 중복 체크 클릭시
  const validateUserId = async () => {
    if (!formData.userId) {
      setFormMessage((prev) => ({
        ...prev,
        userId: FORM_FIELDS.userId.errorMessage.empty,
      }));
      setIsUserIdValidated(false);
      return;
    } else if (!inputRegexs.userId.test(formData.userId)) {
      setFormMessage((prev) => ({
        ...prev,
        userId: FORM_FIELDS.userId.errorMessage.invalid,
      }));
      setIsUserIdValidated(false);
      return;
    }

    // 아이디 중복 체크
    try {
      const result = await checkUserIdExists(formData.userId);
      if (result.userIdAvailable) {
        setFormMessage((prev) => ({
          ...prev,
          userId: FORM_FIELDS.userId.errorMessage.available,
        }));
        setIsUserIdValidated(true);
      } else {
        setFormMessage((prev) => ({
          ...prev,
          userId: FORM_FIELDS.userId.errorMessage.duplicate,
        }));
        setIsUserIdValidated(false);
      }
    } catch {
      setFormMessage((prev) => ({
        ...prev,
        userId: SERVER_ERROR,
      }));
      setIsUserIdValidated(false);
    }
  };

  const handleAddressSelect = (address) => {
    setFormData((prev) => ({ ...prev, address }));
    setIsAddressModalOpen(false);
  };

  /**
   * 중복 확인 버튼을 누르면 유효성 검사 후 아이디 중복체크
   * 회원 가입 버튼을 누르면 중복 확인이 되었는지 검사 후
   * 회원 가입 요청
   */
  const handleSubmit = async (e) => {
    e.preventDefault();
    const errors = validateForm();
    setFormMessage(errors);

    if (Object.keys(errors).length > 0) {
      return;
    }

    if (!isUserIdValidated) {
      setFormMessage((prev) => ({
        ...prev,
        userId: FORM_FIELDS.userId.errorMessage.verifyPrompt,
      }));
      return;
    }

    try {
      await signUpUser(formData);
      setIsSignUpSuccessVisible(true);
    } catch (error) {
      setIsSignUpFailVisible(true);
    }
  };

  const completeLogin = () => {
    setIsSignUpSuccessVisible(false);
    navigate('/');
  };

  const closeDialog = () => {
    setIsSignUpFailVisible(false);
  };

  const renderInputField = (field) => (
    <>
      <CommonInput
        placeholder={FORM_FIELDS[field].placeholder}
        text={FORM_FIELDS[field].text}
        type={FORM_FIELDS[field].type}
        value={formData[field]}
        onChange={(e) => handleInputChange(e, field)}
        {...InputProps}
      />
      {formMessage[field] && (
        <ValidationMessage
          text={formMessage[field]}
          type={'error'}
          $margin="0 10px"
        />
      )}
      <CommonHr />
      <div style={ContainerProps} />
    </>
  );

  return (
    <CommonRoot>
      <FullContainer>
        <MiddleContainer>
          <CommonPageInfo title="회원가입" />
          <InputUserIdBox>
            <CommonInput
              placeholder="아이디를 입력하세요."
              text="아이디"
              onChange={(e) => handleInputChange(e, 'userId')}
              {...InputProps}
            />
            <div style={{ marginLeft: '10px ' }}>
              <CommonButton
                {...ButtonProps}
                text="중복확인"
                width="100px"
                onClick={validateUserId}
              />
            </div>
          </InputUserIdBox>
          <ValidationMessage
            text={formMessage.userId}
            type={isUserIdValidated ? 'success' : 'error'}
            $margin={'0 10px'}
          />
          <CommonHr />
          <InputUserIdBox>
            <CommonInput
              placeholder={FORM_FIELDS['address'].placeholder}
              text="주소"
              value={formData.address}
              onChange={(e) => handleInputChange(e, 'address')}
              {...InputProps}
            />
            <div style={{ marginLeft: '10px' }}>
              <CommonButton
                {...ButtonProps}
                text="주소찾기"
                width="100px"
                onClick={() => setIsAddressModalOpen(true)}
              />
            </div>
          </InputUserIdBox>
          {formMessage.address && (
            <ValidationMessage
              text={FORM_FIELDS['address'].errorMessage.empty}
              type={'error'}
              $margin="0 10px"
            />
          )}
          <CommonHr />
          {renderInputField(
            'password',
            '비밀번호를 입력하세요',
            '비밀번호',
            'password',
          )}
          {renderInputField(
            'confirmPassword',
            '비밀번호를 입력하세요',
            '비밀번호 확인',
            'password',
          )}
          {renderInputField('name', '이름을 입력하세요', '이름')}
          {renderInputField('email', '이메일을 입력하세요', '이메일')}
        </MiddleContainer>
        <CommonButton {...ButtonProps} text="회원가입" onClick={handleSubmit} />
        <CommonDialog
          open={isSignUpSuccessVisible}
          children={'회원가입에 성공했습니다!'}
          onClose={completeLogin}
          onClick={completeLogin}
        />
        <CommonDialog
          open={isSignUpFailVisible}
          children={
            '계정을 만드는 중 문제가 발생했습니다. 잠시 후 다시 시도해주세요.'
          }
          onClose={closeDialog}
          onClick={closeDialog}
        />
        <SearchAddressDialog
          open={isAddressModalOpen}
          setModalVisible={setIsAddressModalOpen}
          onCompletePost={handleAddressSelect}
        />
      </FullContainer>
    </CommonRoot>
  );
}
