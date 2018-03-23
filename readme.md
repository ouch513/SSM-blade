## SSM 框架整合
基于 SpringMVC + Spring + MyBatis 整合的框架  
便于新手进行框架搭建的学习,也可以在此之上进行项目开发   
  
**功能：**
>1、登录注册    
2、用户管理  
3、权限管理 cms     
4、自搭建的简易API Token登录   
5、站内消息发布管理（集成Ueditor） [可作为一个简单实例（增删改查）]  

**结构介绍(以 发布公告 `Bulletin` 为例)：**
```
SSM
  |
  ├─ config
  |    |
  |    ├─ database     // MyBatis 配额文件目录
  |    |    | 
  |    |    ├─ mapper  // mapper 接口文件目录
  |    |    |    |
  |    |    |    ├─ BulletinMapper.xml  
  |    |    |    └─ ... 
  |    |    └─ ...
  |    |
  |    └─ spring       // spring 配置文件目录
  |  
  |      
  ├─ src.main.ouch     // 项目 package 目录
  |    |
  |    ├─ commom       // 工具类目录
  |    |    | 
  |    |    ├─ format  // mapper 接口文件目录
  |    |    |    |
  |    |    |    ├─ JsonResponse.class // json返回值组装类
  |    |    |    └─ ... 
  |    |    └─ tool    // 工具类目录
  |    |
  |    ├─ constant     // 常量类目录
  |    |    | 
  |    |    ├─ Message.class  // 提示信息常量
  |    |    |   
  |    |    ├─ PermissionType.class  // 权限类型常量 （0-管理员权限，1-公共权限）
  |    |    |    
  |    |    └─ Role.class     // 用户角色常量（0-普通用户，1-管理员，2-超级管理员）
  |    |
  |    └─ core         // 项目核心包目录
  |         |      
  |         ├─ dao     // BulletinDao.interface (持久层)
  |         |    
  |         ├─ domain  // BulletinDao.class (Bean)
  |         |  
  |         ├─ service // BulletinService.interface (业务层)
  |         |     |
  |         |     └─ impl/BulletinServiceInplement.class
  |         |   
  |         └─ web
  |             |      
  |             ├─ aop     // CheckController (AOP登录检验 与 权限验证 功能)
  |             |    
  |             ├─ api     // BulletinApiController.class (API接口：Json数据格式返回)
  |             |  
  |             └─ dashboard/BulletinController  // MVC 显示
  |
  |
  └─ web     // 项目 package 目录
      |
      ├─ module       // 工具类目录
      |    | 
      |    ├─ commom     // 配置一些jsp页面可用的常量
      |    |
      |    ├─ dashboard  // 后台管理模块的 view
      |    |
      |    └─ static     // 静态资源文件目录
      |
      └─ WEB-INF      // jar包（ /lib ） 和 web.xml
```  
  
  
     
**测试用户**  
用户名：`ouch`  
密码：`123123`  
权限类型：`超级管理员`（2）
