package com.liclass.admin.management.qnaboard.service;

import com.liclass.admin.management.qnaboard.dao.QnaBoardDao;
import com.liclass.admin.management.qnaboard.vo.QnaBoardVo;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QnaBoardServiceImpl implements QnaBoardService{

    @Setter (onMethod_ = @Autowired)
    private QnaBoardDao qnaBoardDao;

    @Override
    public List<QnaBoardVo> qnaBoardList(QnaBoardVo qnaBoard) {
        List<QnaBoardVo> list = null;
        list = qnaBoardDao.qnaBoardList(qnaBoard);

        return list;
    }

    @Override
    public int qnaBoardInsert(QnaBoardVo qnaBoard) {
        int result = 0;
        result = qnaBoardDao.qnaBoardInsert(qnaBoard);

        return result;
    }

    @Override
    public QnaBoardVo qnaBoardDetail(QnaBoardVo qnaBoard) {
        QnaBoardVo detail = null;

        detail = qnaBoardDao.qnaBoardDetail(qnaBoard);
        if(detail != null){
            detail.setQna_content(detail.getQna_content().toString().replaceAll("\n", "<br />"));
        }
        return detail;
    }

    @Override
    public int qnaBoardDelete(QnaBoardVo qnaBoard) {
        int result = 0;
        result = qnaBoardDao.qnaBoardDelete(qnaBoard);

        return result;
    }

    @Override
    public QnaBoardVo qnaAnswerForm(QnaBoardVo qnaBoard){
        QnaBoardVo answerData = null;
        answerData = qnaBoardDao.qnaBoardDetail(qnaBoard);

        return answerData;
    }
    @Override
    public int qnaAnswerInsert(QnaBoardVo qnaBoard) {
        int result = 0;
            qnaBoardDao.qnaAnswerStepUpdate(qnaBoard);

            result = qnaBoardDao.qnaAnswerInsert(qnaBoard);

        return result;
    }
}
