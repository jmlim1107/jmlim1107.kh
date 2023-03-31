package com.liclass.admin.statistics.service;

import com.liclass.admin.statistics.dao.StatisticsDao;
import com.liclass.client.login.vo.UserVO;
import com.liclass.client.payment.vo.PaymentVO;
import com.liclass.client.reserve.vo.ReserveVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StatisticsServiceImpl implements StatisticsService{

    @Setter(onMethod_ = @Autowired)
    private StatisticsDao statisticsDao;

    @Override
    public HashMap<String, Integer> userStatistics(UserVO user){
        HashMap<String, Integer> userData = null;
        userData = statisticsDao.userStatistics(user);

        return userData;
    }

    @Override
    public List<Map<String, Object>> quarterStatistics(PaymentVO payment) {
        List<Map<String, Object>> salesData = null;
        salesData = statisticsDao.quarterStatistics(payment);

        return salesData;
    }

    @Override
    public HashMap<String, Integer> allSales(PaymentVO payment) {
        HashMap<String, Integer> sales = null;
        sales = statisticsDao.allSales(payment);
        return sales;
    }

    @Override
    public List<Map<String, Object>> levelStatistics(PaymentVO payment) {
        List<Map<String, Object>>level = null;
        level = statisticsDao.levelStatistics(payment);

        return level;
    }

    @Override
    public HashMap<String, Integer> reserveStatistics(ReserveVO reserve) {
        HashMap<String, Integer> reserves = null;
        reserves = statisticsDao.reserveStatistics(reserve);

        return reserves;
    }


}
