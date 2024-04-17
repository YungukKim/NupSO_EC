package service;

import dao.FurnitureDAO;
import dao.FurnitureDAOImpl;
import dto.FurnitureDTO;

import java.io.IOException;
import java.sql.SQLException;

public class FurnitureServiceImpl implements FurnitureService {
    private FurnitureDAO furnitureDAO = new FurnitureDAOImpl();

    @Override
    public FurnitureDTO selectFurnitureNumber(String furnitureNumber) throws SQLException {
        FurnitureDTO furnitureDTO = furnitureDAO.selectByFurnitureByNumber(furnitureNumber);
        if (furnitureDTO == null) throw new SQLException("해당 모델 번호에 해당하는 정보가 없습니다.");
        return furnitureDTO;
    }

    @Override
    public int findFurnitureSeqByNumber(String furnitureNumber) throws SQLException {
        int furnitureSeq = furnitureDAO.findFurnitureSeqByNumber(furnitureNumber);
        if (furnitureSeq == -1) throw new SQLException("해당 모델 번호에 해당하는 정보가 없습니다.");
        return furnitureSeq;
    }
}