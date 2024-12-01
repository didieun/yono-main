import React from 'react';
import styled from 'styled-components';
import CustomSlides from '../mycard/CardSlider';
import { registeredCardData } from '../../mockData/cardMockData';

const StyledWrap = styled.div`
  margin-top: 30px;
  width: 100%;
  height: auto;
`;

const StyledCardContainer = styled.div`
  margin: -18px 0 30px 0;
`;

const StyledCardP = styled.p`
  font-size: 30px;
  font-weight: bold;
`;

const MainCardBox = () => {
  // 등록된 카드 데이터
  const cardData = registeredCardData;

  return (
    <StyledWrap>
      <StyledCardP>나의 등록 카드</StyledCardP>
      <StyledCardContainer>
        <CustomSlides cardData={cardData} showDetailed={true} />
      </StyledCardContainer>
    </StyledWrap>
  );
};

export default MainCardBox;
