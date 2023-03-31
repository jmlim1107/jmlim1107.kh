package com.liclass.admin.management.dashboard.service;

import com.liclass.admin.management.dashboard.vo.DashBoardVo;
import com.liclass.admin.management.qnaboard.vo.QnaBoardVo;
import org.springframework.data.relational.core.sql.In;

import java.util.HashMap;
import java.util.List;

public interface DashBoardService {
    public List<QnaBoardVo> noticeList(QnaBoardVo qnaBoard);
    public List<QnaBoardVo> qnaList(QnaBoardVo qnaBoard);

    public QnaBoardVo noticeDetail(QnaBoardVo qnaBoard);
    public QnaBoardVo qnaDetail(QnaBoardVo qnaBoard);

    public HashMap<String, Integer> userState(DashBoardVo dashBoard);

    public HashMap<String, Integer> userReserve(DashBoardVo dashBoard);

    public HashMap<String, Integer> allSales(DashBoardVo dashBoard);

}
