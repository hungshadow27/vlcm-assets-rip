package com.tgame.manager
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.zcp.common.handler.HandlerThread;
   import com.zcp.common.log.ZLog;
   
   public class ProcessManager
   {
      
      public function ProcessManager()
      {
         super();
      }
      
      public static function enterChat() : void
      {
         if(GameState.loadThread2Complete && GameState.enterLineSucess)
         {
            if(NetWorkManager.chatSocket != null && NetWorkManager.chatSocket.connected)
            {
               PipeManager.sendMsg(PipeConstants.ENTER_CHAT);
            }
         }
      }
      
      public static function enterLine() : void
      {
         PipeManager.sendMsg(PipeConstants.ENTER_LINE);
      }
      
      public static function clientReady() : void
      {
         var startupFacade:Function;
         var sendMsg:Function;
         var delay:Number = NaN;
         var ht:HandlerThread = null;
         var facadeArr:Array = null;
         var facadeName:String = null;
         var i:int = 0;
         var len:int = 0;
         var msgArr:Array = null;
         var msg:String = null;
         var len2:int = 0;
         if(GameState.loadThread2Complete && GameState.enterLineSucess)
         {
            GameInstance.uiInstance.mainUI.setLineName(GameConfig.lineName);
            if(GameState.fristEnterScene || GameState.switchServer)
            {
               GameState.switchServer = false;
               enterChat();
            }
            if(GameState.fristEnterScene)
            {
               startupFacade = function(param1:int, param2:String):void
               {
                  TPreLoader.updateLoadingUI(LanResManager.getLanCommonTextWords("正在启动程序模块"),(param1 + 1) / len);
                  FacadeManager.startupFacade(param2);
               };
               sendMsg = function(param1:int, param2:String):void
               {
                  TPreLoader.updateLoadingUI(LanResManager.getLanCommonTextWords("正在初始化界面"),(param1 + 1) / len2);
                  PipeManager.sendMsg(param2);
               };
               GameState.fristEnterScene = false;
               ZLog.add("ProcessManager:正在启动程序模块 和 初始化界面");
               TPreLoader.showLoadingUI(LanResManager.getLanCommonTextWords("正在启动程序模块"));
               if(NetWorkManager.loginSocket != null && NetWorkManager.loginSocket.connected)
               {
                  NetWorkManager.loginSocket.close();
               }
               delay = 5;
               ht = new HandlerThread();
               facadeArr = [PipeConstants.STARTUP_UI,PipeConstants.STARTUP_MAINUI,PipeConstants.STARTUP_CHAR,PipeConstants.STARTUP_ZHAN_WEN_KE_HUA,PipeConstants.STARTUP_FIGHT,PipeConstants.STARTUP_MOUNT,PipeConstants.STARTUP_EQUIP_PUDDING,PipeConstants.STARTUP_SKILL,PipeConstants.STARTUP_ATTRIBUTE,PipeConstants.STARTUP_JINGMAI,PipeConstants.STARTUP_TEAM,PipeConstants.STARTUP_MALL,PipeConstants.STARTUP_FRIEND,PipeConstants.STARTUP_GIFT,PipeConstants.STARTUP_ITEM,PipeConstants.STARTUP_ITEM_SYNTHESIZE,PipeConstants.STARTUP_NPC,PipeConstants.STARTUP_RANK,PipeConstants.STARTUP_TASK,PipeConstants.STARTUP_DA_ZUO,PipeConstants.STARTUP_STUDYBTN,PipeConstants.STARTUP_AFK,PipeConstants.STARTUP_NEW_PLAYER_GUIDE,PipeConstants.STARTUP_CHAT,PipeConstants.STARTUP_PICKUP,PipeConstants.STARTUP_ACHIEVEMENT,PipeConstants.STARTUP_TEITCH_GIFT,PipeConstants.STARTUP_SETTING,PipeConstants.STARTUP_REFRESH_POINT,PipeConstants.STARTUP_ZHEN_DOLL,PipeConstants.STARTUP_SHOUJI,PipeConstants.STARTUP_BANGHUI,PipeConstants.STARTUP_STONE
               ,PipeConstants.STARTUP_MOVING,PipeConstants.STARTUP_AMULET,PipeConstants.STARTUP_WEDDING,PipeConstants.STARTUP_FEAST,PipeConstants.STARTUP_LIANTI,PipeConstants.STARTUP_BOWARROW,PipeConstants.STARTUP_NitaCyclone,PipeConstants.STARTUP_KUAFUZHAN,PipeConstants.STARTUP_KUAFULEITAI,PipeConstants.STARTUP_DUGUJIUJIAN,PipeConstants.STARTUP_SILINGZHEN,PipeConstants.STARTUP_KUAUF3V3,PipeConstants.STARTUP_PARTY_TASK,PipeConstants.STARTUP_SHUXINGDAZAOKA,PipeConstants.STARTUP_DONGXIAO,PipeConstants.STARTUP_TU_TENG_CADE,PipeConstants.STARTUP_ORANGE_EQUIP,PipeConstants.STARTUP_BAGUAZHANG,PipeConstants.STARTUP_JIUYANGSHENGONG,PipeConstants.STARTUP_JIUYINZHENJING,PipeConstants.STARTUP_ZIXIASHENGONG,PipeConstants.STARTUP_BIWUDAHUI,PipeConstants.STARTUP_BAOSHIJIANSHANG,PipeConstants.STARTUP_XIANGLONG,PipeConstants.STARTUP_YIJINJING,PipeConstants.STARTUP_XISUIJING,PipeConstants.STARTUP_CANGJINGGE,PipeConstants.STARTUP_SHISHIZHANKUANG,PipeConstants.STARTUP_FEILONGTANYUESHOU,PipeConstants.STARTUP_YUNCHENG,PipeConstants
               .STARTUP_WUXINGQUAN,PipeConstants.STARTUP_SHIBATONGREN,PipeConstants.STARTUP_LIUMAISHENJIAN,PipeConstants.STARTUP_QINGGONGYAN,PipeConstants.STARTUP_WUXINGZHIREN,PipeConstants.STARTUP_JINZHONGZHAO,PipeConstants.STARTUP_BIWU_CROSSPLATFORM,PipeConstants.STARTUP_XIUWEI,PipeConstants.STARTUP_ZHANHUNHUODE,PipeConstants.STARTUP_ZHANHUN,PipeConstants.STARTUP_XUNZHANGDUANZAO,PipeConstants.STARTUP_TAIXUANSHENGONG,PipeConstants.STARTUP_JIUQUHUANGHEZHEN,PipeConstants.STARTUP_BEIMINGSHENGONG,PipeConstants.STARTUP_SHENJIGNZHAO,PipeConstants.STARTUP_QISHANGQUAN,PipeConstants.STARTUP_QIMENZHEN,PipeConstants.STARTUP_CISHA,PipeConstants.STARTUP_AOJIANZHENGBA,PipeConstants.STARTUP_AOJIANZHUZAO,PipeConstants.STARTUP_CHRISTMASRANK,PipeConstants.STARTUP_HAMAGONG,PipeConstants.STARTUP_TIANFU,PipeConstants.STARTUP_MONTHSIGNIN,PipeConstants.STARTUP_WUXINGZHEN,PipeConstants.STARTUP_JUBAOPEN,PipeConstants.STARTUP_XUNZHANGDUIHUAN,PipeConstants.STARTUP_XUNZHANG,PipeConstants.STARTUP_DANTIAOWANG,PipeConstants.STARTUP_MOXUE_DOLL
               ,PipeConstants.STARTUP_CHIXUEMOZHEN,PipeConstants.STARTUP_SANSHILIUSHOU,PipeConstants.START_BEIDOUQIXINGZHEN,PipeConstants.STARTUP_JINCHANTUOQIAO,PipeConstants.STARTUP_TIMEBAOZANG,PipeConstants.STARTUP_ZHENWUQIJIEZHEN,PipeConstants.STARTUP_DOUZHUANXINGYI,PipeConstants.STARTUP_XUNZHANGYANGCHENG,PipeConstants.STARTUP_TIANJIANGXIANGRUI,PipeConstants.STARTUP_GUILIUZHEN,PipeConstants.STARTUP_MEIREN,PipeConstants.STARTUP_LONGWENKEHUA,PipeConstants.STARTUP_BIWUZHAOQIN,PipeConstants.STARTUP_JINGANGFUMOQUAN,PipeConstants.STARTUP_QINLONGGONG,PipeConstants.STARTUP_CHIBANG,PipeConstants.STARTUP_TENGTIANYI,PipeConstants.STARTUP_XIAOYAOYUFENG,PipeConstants.STARTUP_LIANQI,PipeConstants.STARTUP_TIANMENZHEN,PipeConstants.STARTUP_BIHAICHAOSHENGQU,PipeConstants.STARTUP_HEYIZHEN,PipeConstants.STARTUP_YULIZHEN,PipeConstants.STARTUP_YUXIAOJIANFA,PipeConstants.STARTUP_YANYUEZHEN,PipeConstants.STARTUP_CHANGSHEZHEN,PipeConstants.STARTUP_CANHEZHI,PipeConstants.STARTUP_JILEIZHI,PipeConstants.STARTUP_TIANSHANGZHIHUN
               ,PipeConstants.STARTUP_EMOZHIYI,PipeConstants.STARTUP_XUANXIANGZHEN,PipeConstants.STARTUP_YANXINGZHEN,PipeConstants.STARTUP_MENPAIZHUANGHUAN,PipeConstants.STARTUP_EQUIPMENPAIZHUANGHUAN,PipeConstants.STARTUP_JUEZHANGUANGMINGDING,PipeConstants.STARTUP_GANJIANGMOYE,PipeConstants.STARTUP_SHENDIAOXIALV,PipeConstants.STARTUP_GANJIANGMOYEZHUZAO,PipeConstants.STARTUP_FASHION,PipeConstants.STARTUP_FENGZHENGJIE,PipeConstants.STARTUP_YUENANJUBAOPEN,PipeConstants.STARTUP_RENAME,PipeConstants.STARTUP_YUENANSHIJIEBEIRANK,PipeConstants.STARTUP_YUENAN888SHOP,PipeConstants.STARTUP_YUENANAOJIANZHIZAO,PipeConstants.STARTUP_YUENANONLINE,PipeConstants.STARTUP_YNHUANGDAOZHUANPAN,PipeConstants.STARTUP_ZHIZHANZHISHANG,PipeConstants.STARTUP_YUENAN2014ZHOGNQIU,PipeConstants.STARTUP_HUTAOZHEN,PipeConstants.STARTUP_YUNLONGZHEN,PipeConstants.STARTUP_XIANTIANGONG,PipeConstants.STARTUP_PANGXIEZHEN,PipeConstants.STARTUP_XUEDAOXINFA,PipeConstants.STARTUP_TIANFUZHEN,PipeConstants.STARTUP_NIAOXIANGZHEN,PipeConstants.STARTUP_HUYIJUEXING
               ,PipeConstants.STARTUP_TUSHIDAHUI,PipeConstants.STARTUP_DIZAIZHEN,PipeConstants.STARTUP_FENGYANGZHEN,PipeConstants.STARTUP_LONGYAJUEXING,PipeConstants.STARTUP_ZUNRONGWANBAOGE,PipeConstants.STARTUP_QUANSHENJUEXING,PipeConstants.STARTUP_WUDUZHEN,PipeConstants.STARTUP_LONGYINJUEXING,PipeConstants.STARTUP_SHENXINGBAIBIAN,PipeConstants.STARTUP_LANGHUNDUN,PipeConstants.STARTUP_NEWYEAR,PipeConstants.STARTUP_QINGRENJIESONGHUA,PipeConstants.STARTUP_QINGRENJIE_SONGHUABANG,PipeConstants.STARTUP_RULAISHENZHANG,PipeConstants.STARTUP_WOHUCANGLONG,PipeConstants.STARTUP_LUOYINGSHENJIANZHANG,PipeConstants.STARTUP_WISHINGTREE,PipeConstants.STARTUP_DUGUQIUBAI,PipeConstants.STARTUP_BAZHENTU,PipeConstants.STARTUP_YURENJIE,PipeConstants.STARTUP_XUANTIEJIANFA,PipeConstants.STARTUP_CHANGSHENGJUE,PipeConstants.STARTUP_WANHUNZHEN,PipeConstants.STARTUP_GERENCHENGHAO,PipeConstants.STARTUP_WODEMENPAI,PipeConstants.STARTUP_CHUANGONGWUXUE,PipeConstants.STARTUP_ZHENYANSHOUYIN,PipeConstants.STARTUP_HUANGTUBAYE,PipeConstants
               .STARTUP_WODERONGYU,PipeConstants.STARTUP_BANGPAIRONGYUTARGET,PipeConstants.STARTUP_JIANGSHANSHEJISHIZHIXINXI,PipeConstants.STARTUP_ZHENLONGQIJU,PipeConstants.STARTUP_DOUDIZHU,PipeConstants.STARTUP_SHENGSIFU,PipeConstants.STARTUP_TAOHUAZHEN,PipeConstants.STARTUP_XIAKEXING,PipeConstants.STARTUP_MOLINGZHIYI,PipeConstants.STARTUP_FUMOZHANGFA,PipeConstants.STARTUP_FABAO,PipeConstants.STARTUP_YUNVSUXINJIANFA,PipeConstants.STARTUP_DUANWUJIE,PipeConstants.STARTUP_CHAOJILABA,PipeConstants.STARTUP_ZHONGZHIXUANYUANJIAN,PipeConstants.STARTUP_LIEKONGJUEXING,PipeConstants.STARTUP_TIANYUYANMENG,PipeConstants.STARTUP_TIANSHANLIUYANGZHANG,PipeConstants.STARTUP_SHIJIEBEI,PipeConstants.STARTUP_SHENGXIAOTIAOZHAN,PipeConstants.STARTUP_AOJIANSHENJIANGJI,PipeConstants.STARTUP_DUOMINGSHISANJIAN,PipeConstants.STARTUP_WUXIAKAPAI,PipeConstants.STARTUP_RIJINLUN,PipeConstants.STARTUP_QIXIJIE,PipeConstants.STARTUP_TUNSHITIANDI,PipeConstants.STARTUP_KONGMINGQUAN,PipeConstants.STARTUP_BUCHANGFUBEN,PipeConstants.STARTUP_XUEYINJUEXING
               ,PipeConstants.STARTUP_HUASHANLUNJIAN,PipeConstants.STARTUP_YUEJINLUN,PipeConstants.STARTUP_HUANGJINSHU,PipeConstants.STARTUP_HANBINGSHENZHANG,PipeConstants.STARTUP_LINGXIYIZHI,PipeConstants.STARTUP_ZHONGQIUJIE,PipeConstants.STARTUP_YNLONGZHIZHUFU,PipeConstants.STARTUP_YNZHIZUOZONGZI,PipeConstants.STARTUP_WANGZHEZHIBANG,PipeConstants.STARTUP_YUENANLIANHUANCHONGZHI,PipeConstants.STARTUP_XIAOZHUKUAIPAO,PipeConstants.STARTUP_YUENANLONGWUGE,PipeConstants.STARTUP_YNLIULONGZHUANGBEI,PipeConstants.STARTUP_DUIXUEREN,PipeConstants.STARTUP_YUENAN2016NEWYEAR,PipeConstants.STARTUP_YN2016XINGYUNZHUANPAN,PipeConstants.STARTUP_YNCHONGZHIDAFA,PipeConstants.STARTUP_YNZHIMENGSHANGCHENG,PipeConstants.STARTUP_YNTULONGDAO,PipeConstants.STARTUP_YNZHUADAYU,PipeConstants.STARTUP_LONGFENGDANGPU,PipeConstants.STARTUP_XUNZHANGZHANSHI,PipeConstants.STARTUP_QISHAZHEN,PipeConstants.STARTUP_XINGXIUZHEN,PipeConstants.STARTUP_XINGXIUZHEN1,PipeConstants.STARTUP_XINNIANYASUIQIAN,PipeConstants.STARTUP_MOXUEZHANCHANG,PipeConstants
               .STARTUP_XIANGYANGZHIZHAN,PipeConstants.STARTUP_JIANGHUN,PipeConstants.STARTUP_DUANWUJIE2015,PipeConstants.STARTUP_BAGUAZHEN,PipeConstants.STARTUP_SHANGDIAN,PipeConstants.STARTUP_JINGLEIQIANG,PipeConstants.STARTUP_SHIJIANSHALOU,PipeConstants.STARTUP_YNYITIANJIAN,PipeConstants.STARTUP_MINGYUGONG,PipeConstants.STARTUP_TULONGDAO,PipeConstants.STARTUP_JINSHEJIANFA,PipeConstants.STARTUP_CUQIANKUNGFU,PipeConstants.STARTUP_QINGDIESHUANGREN,PipeConstants.STARTUP_YITIANTULONG,PipeConstants.STARTUP_XINGYUNZHUANZHUANLE,PipeConstants.STARTUP_MOSHOUZHANCHANG,PipeConstants.STARTUP_VIP,PipeConstants.STARTUP_XIANMOZHILU,PipeConstants.STARTUP_AOJIANZHUANSHENG,PipeConstants.STARTUP_MENPAIJUEXUE,PipeConstants.STARTUP_MENPAINEIFA,PipeConstants.STARTUP_CANGJIANXUANTIAN,PipeConstants.STARTUP_YUANWU,PipeConstants.STARTUP_WUHUNXITONG,PipeConstants.STARTUP_FUWENKEHUA,PipeConstants.STARTUP_SIJUEJIANZHEN];
               len = int(facadeArr.length);
               i = 0;
               while(i < len)
               {
                  facadeName = facadeArr[i];
                  ht.push(startupFacade,[i,facadeName],delay);
                  i++;
               }
               msgArr = [PipeConstants.SHOW_MAINUI,PipeConstants.CLIENT_READY];
               len2 = int(msgArr.length);
               i = 0;
               while(i < len2)
               {
                  msg = msgArr[i];
                  ht.push(sendMsg,[i,msg],delay);
                  i++;
               }
               ZLog.add("ProcessManager:启动模块和初始化界面完毕");
            }
            else
            {
               ZLog.add("ProcessManager:正在请求进入场景");
               PipeManager.sendMsg(PipeConstants.CLIENT_READY);
            }
         }
         else if(!GameState.loadThread2Complete && GameState.enterLineSucess)
         {
            ZLog.add("ProcessManager:正在加载资源");
            TPreLoader.showLoadingUI(LanResManager.getLanCommonTextWords("正在加载资源(如果较长时间没有响应，请刷新页面)"));
         }
         else if(GameState.loadThread2Complete && !GameState.enterLineSucess)
         {
            ZLog.add("ProcessManager:正在请求进入分线服务器");
         }
         else
         {
            ZLog.add("ProcessManager:error");
         }
      }
      
      public static function enterScene(param1:Array) : void
      {
         PipeManager.sendMsg(PipeConstants.ENTER_SCENE,param1);
      }
   }
}

