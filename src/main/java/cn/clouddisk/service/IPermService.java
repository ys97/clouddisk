package cn.clouddisk.service;

import java.util.List;

public interface IPermService {
    List<String> selectPermsByUserId(int userId);
}
