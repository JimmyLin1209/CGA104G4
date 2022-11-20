package com.store.model;

import com.utils.MailService;
import com.utils.RandomPassword;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class StoreService {

    private StoreDAO_interface dao;

    public StoreService() {
        this.dao = new StoreDAO();
    }

    public StoreVO addStore(String storeAcc, String storePwd, String storeName, String storeGui,
                            String storeTel) {

        StoreVO storeVO = new StoreVO();
        storeVO.setStoreAcc(storeAcc);
        storeVO.setStorePwd(storePwd);
        storeVO.setStoreName(storeName);
        storeVO.setStoreGui(storeGui);
        storeVO.setStoreTel(storeTel);
        dao.insert(storeVO);

        return storeVO;

    }

    public Integer insertWithReturn(String storeAcc, String storePwd, String storeName, String storeTel, String storeCity,
                                    String storeDist, String storeAdr) {

        StoreVO storeVO = new StoreVO();
        storeVO.setStoreAcc(storeAcc);
        storeVO.setStorePwd(storePwd);
        storeVO.setStoreName(storeName);
        storeVO.setStoreTel(storeTel);
        storeVO.setStoreCity(storeCity);
        storeVO.setStoreDist(storeDist);
        storeVO.setStoreAdr(storeAdr);

        try {
            dao.beginTransaction();
            Integer storeId = dao.insertWithReturn(storeVO);
            dao.commit();
            return storeId;
        } catch (Exception e) {
            dao.rollback();
            e.printStackTrace();
            return null;
        }
    }

    public void update(StoreVO storeVO) {
        try {
            dao.beginTransaction();
            dao.update(storeVO);
            dao.commit();
        } catch (Exception e) {
            dao.rollback();
            e.printStackTrace();
        }
    }

    public StoreVO updateStore(Integer storeId, String storeAcc, String storePwd, String storeName,
                               String storeGui, String storeTel) {

        StoreVO storeVO = new StoreVO();

        storeVO.setStoreId(storeId);
        storeVO.setStoreAcc(storeAcc);
        storeVO.setStorePwd(storePwd);
        storeVO.setStoreName(storeName);
        storeVO.setStoreGui(storeGui);
        storeVO.setStoreTel(storeTel);
        dao.update(storeVO);

        return storeVO;

    }

    public void updatePwd(StoreVO storeVO) {
        try {
            dao.beginTransaction();
            dao.updatePwd(storeVO);
            dao.commit();
        } catch (Exception e) {
            dao.rollback();
            e.printStackTrace();
        }

    }

    public StoreVO findByStoreId(Integer storeId) {
        try {
            dao.beginTransaction();
            StoreVO storeVO = dao.findByStoreId(storeId);
            dao.commit();
            return storeVO;
        } catch (Exception e) {
            dao.rollback();
            return null;
        }

    }

    public void deleteStore(Integer storeId) {
        dao.delete(storeId);
    }

    public StoreVO getOneStore(Integer storeId) {
        return dao.findByPrimaryKey(storeId);
    }

    public List<StoreVO> getAll() {
        return dao.getAll();
    }

    public boolean forgetPwd(String storeAcc) {
        try {
            dao.beginTransaction();
            Integer storeId = dao.selectByStoreAcc(storeAcc);
            if (storeId == null) {
                dao.commit();
                return false;
            }
            String randomPwd = new RandomPassword().genRandomPassword();
            StoreVO storeVO = new StoreVO();
            storeVO.setStoreId(storeId);
            storeVO.setStorePwd(randomPwd);
            dao.updatePwd(storeVO);

            String title = "您的吉食響樂會員密碼更新";
            String message = "您的新密碼為:" + randomPwd + "，請盡速登入並進行密碼變更。";
            new MailService().sendMail(storeAcc, title, message);

            dao.commit();
            return true;
        } catch (Exception e) {
            dao.rollback();
            e.printStackTrace();
            return false;
        }
    }

    public Integer selectByStoreAcc(String storeAcc) {

        try {
            dao.beginTransaction();
            Integer memId = dao.selectByStoreAcc(storeAcc);
            dao.commit();
            return memId;
        } catch (Exception e) {
            dao.rollback();
            e.printStackTrace();
            return null;
        }
    }

    public StoreVO login(String storeAcc, String storePwd) {
        try {
            dao.beginTransaction();
            StoreVO storeVO = dao.login(storeAcc, storePwd);
            dao.commit();
            return storeVO;
        } catch (Exception e) {
            dao.rollback();
            e.printStackTrace();
            return null;
        }
    }
}
