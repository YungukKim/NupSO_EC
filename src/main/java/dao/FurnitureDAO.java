package dao;

import dto.FurnitureDTO;

import java.sql.SQLException;

public interface FurnitureDAO {
    /*
    상품 상세 보기
     */
    FurnitureDTO selectByFurnitureByNumber(String furnitureNumber) throws SQLException;

    /*
    상품 코드로 상품 sequence 찾기
     */
    int findFurnitureSeqByNumber(String furnitureNumber) throws SQLException;
}
