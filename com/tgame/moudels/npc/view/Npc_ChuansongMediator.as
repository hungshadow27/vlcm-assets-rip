package com.tgame.moudels.npc.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.common.staticdata.SpecialMapID;
   import com.tgame.common.staticdata.SynthesizeMsg;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.SmallLoadingBar;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.KeyboardManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.npc.Npc_ApplicationFacade;
   import com.tgame.moudels.npc.model.Npc_MsgSenderProxy;
   import com.tgame.shell.view.components.XinnianZhufuPanel;
   import com.tgame.shell.view.components.shuiguoleiji.ShuiGuoLeiJiDuiHuanPanel;
   import com.tgame.shell.view.components.utils.UITools;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.external.ExternalInterface;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Npc_ChuansongMediator extends Mediator
   {
      
      public static const NAME:String = "Npc_ChuansongMediator";
      
      private var npcID:int = -1;
      
      private var xnzf:XinnianZhufuPanel;
      
      private var _sender:Npc_MsgSenderProxy;
      
      public function Npc_ChuansongMediator()
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Npc_ApplicationFacade.NPC_REQ_FUNCTION,Npc_ApplicationFacade.FENGZHENGJIEDUIHUAN_CLICK,Npc_ApplicationFacade.SEND_RENAME,Npc_ApplicationFacade.SEND_NPCID,Npc_ApplicationFacade.SEND_YUENANAOJIANHECHENG,Npc_ApplicationFacade.SEND_YUENANGOODDELETE,Npc_ApplicationFacade.SEND_53095,Npc_ApplicationFacade.SEND_83205,Npc_ApplicationFacade.SEND_53099,Npc_ApplicationFacade.SEND_82241,Npc_ApplicationFacade.YN_WUPINFENJIE,Npc_ApplicationFacade.YN_REQUEST_JINXIANG,Npc_ApplicationFacade.YN_REQUEST_MUYUHU_START,Npc_ApplicationFacade.YN_REQUEST_BAOSHU_START,Npc_ApplicationFacade.YN_REQUEST_YUENAN2015ZHONGQIU,Npc_ApplicationFacade.YN_CHONGZHIPANEL,Npc_ApplicationFacade.YN_SHOW_CHRISTMAS_2015,Npc_ApplicationFacade.SHOW_YNQIANGHUAZHISHEN_PANEL,Npc_ApplicationFacade.SHOW_YNXINNIANZHUFUPANEL,Npc_ApplicationFacade.SHOW_YN2016TIANDENG,Npc_ApplicationFacade.SHOW_YN2016SHIERDIZHI,Npc_ApplicationFacade.SHOW_YNSHANXIAQIJIAN,Npc_ApplicationFacade.SHOW_YNSHOUYIN,Npc_ApplicationFacade.SHOW_QIZIQUANZHENJIAO,Npc_ApplicationFacade
         .SHOW_2016XIUWEIWUXUE,Npc_ApplicationFacade.SHOW_YN2016LIUMAIJIANPLANE,Npc_ApplicationFacade.SHOW_ZHENTIANSHENQIPLANE,Npc_ApplicationFacade.SHOW_HUAZHUANGLIBAO_PANEL,Npc_ApplicationFacade.SHOW_CHIBANGLIBAO_PANEL,Npc_ApplicationFacade.SHOW_YN2016WANGZHEZHANQI,Npc_ApplicationFacade.SHOW_YNLUOHANHUTI,Npc_ApplicationFacade.SHOW_YNNVQUANHUODONG,Npc_ApplicationFacade.SHOW_YNWULINSHENQIPANEL,Npc_ApplicationFacade.SHOW_YNJUEDINGSHENBINGPANEL,Npc_ApplicationFacade.SHOW_YNHUTISHANGYIPANEL,Npc_ApplicationFacade.SHOW_YNWUSHUANGPUPANEL,Npc_ApplicationFacade.SHOW_YNSHISANJIANHUN,Npc_ApplicationFacade.SHOW_WANGZHEZHUANGBEI];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var noteBody:Object = null;
         var type:int = 0;
         var name:String = null;
         var npcChar:SceneCharacter = null;
         var ar:Array = null;
         var go:Goods = null;
         var ty:int = 0;
         var n:int = 0;
         var id:int = 0;
         var player:AttributeInfo = null;
         var arr:Array = null;
         var ti:int = 0;
         var time:Timer = null;
         var onEnterFarme2:Function = null;
         var onEnterFarme3:Function = null;
         var onEnterFarme4:Function = null;
         var goods:Goods = null;
         var str:String = null;
         var note:INotification = param1;
         noteBody = note.getBody();
         switch(note.getName())
         {
            case Npc_ApplicationFacade.NPC_REQ_FUNCTION:
               type = Number(noteBody);
               if(GameInstance.lockOnChar != null)
               {
                  if(type == NpcFunctionType.TO_XIANGYANGCHENG)
                  {
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"正在准备传送");
                     this.sender.send_30001([GameInstance.lockOnChar.id,SpecialMapID.XYC_ID]);
                  }
                  else if(type == NpcFunctionType.TO_YUANYUESHANZHUANG)
                  {
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"正在准备传送");
                     this.sender.send_30001([GameInstance.lockOnChar.id,SpecialMapID.YYSZ_ID]);
                  }
                  else if(type == NpcFunctionType.AOJIAN_BIRTHDAY)
                  {
                     this.sender.send_53095([2]);
                  }
                  else if(type == NpcFunctionType.AOJIAN_CHRISTMAS)
                  {
                     this.sender.send_53095([2]);
                  }
                  else if(type == NpcFunctionType.AOJIAN_XINIANZHUFU || type == NpcFunctionType.YUENAN_XITONGZHUFU)
                  {
                     this.showZhufUPanel();
                  }
                  else if(type == NpcFunctionType.YUENAN_PENGYOUZHUFU)
                  {
                     PipeManager.sendMsg(PipeConstants.SHOW_QINGRENJIESONGHUA_PLANE,2);
                  }
                  else if(type == NpcFunctionType.AOJIAN_XINNIANXUYUAN)
                  {
                     this.sender.send_53095([4]);
                  }
                  else if(type == NpcFunctionType.YUENAN_ZENGSONGTANGGUO)
                  {
                     if(this.npcID == -1)
                     {
                        return;
                     }
                     this.sender.send_53095([7,this.npcID]);
                  }
                  else if(type == NpcFunctionType.AOJIANSUIPIANHECHENG_YUENAN)
                  {
                     if(!Fun.isVisible(GameInstance.uiInstance.ynaojianhechengPanel))
                     {
                        GameInstance.uiInstance.ynaojianhechengPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.ynaojianhechengPanel.width / 2;
                        GameInstance.uiInstance.ynaojianhechengPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.ynaojianhechengPanel.height / 2;
                        GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.ynaojianhechengPanel);
                     }
                  }
                  else if(type == NpcFunctionType.GOOD_DELETE_YUENAN)
                  {
                     if(!Fun.isVisible(GameInstance.uiInstance.ynGoodDeletePanel))
                     {
                        GameInstance.uiInstance.ynGoodDeletePanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.ynGoodDeletePanel.width / 2;
                        GameInstance.uiInstance.ynGoodDeletePanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.ynGoodDeletePanel.height / 2;
                        GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.ynGoodDeletePanel);
                     }
                  }
                  else if(type == NpcFunctionType.YUENAN_HUANGUAYI)
                  {
                     this.sender.send_53095([10]);
                  }
                  else if(type == NpcFunctionType.YUENAN_HUANLIBAO)
                  {
                     this.sender.send_53095([11]);
                  }
                  else if(type == NpcFunctionType.YUENAN_ZHONGQIU_LINGJIANG || type == NpcFunctionType.YUENAN_SANNIANJIANGLI || type == NpcFunctionType.YUENAN_CHRISTMAS_GIFT2)
                  {
                     PipeManager.sendMsg(PipeConstants.REQUEST_YUENAN2014ZHONGQIU_PANEL,type);
                  }
                  else if(type == NpcFunctionType.YUENAN_WEIGUIJUBAO)
                  {
                     PipeManager.sendMsg(PipeConstants.SHOW_QINGRENJIESONGHUA_PLANE,4);
                  }
                  else if(type == NpcFunctionType.YUENAN_JINXIANG)
                  {
                     PipeManager.sendMsg(PipeConstants.YN_REQUEST_JINXIANG,1);
                  }
                  else if(type == NpcFunctionType.YUENAN_JIANZHUZHUI)
                  {
                     if(!Fun.isVisible(GameInstance.uiInstance.ynJinxiangPanel))
                     {
                        POPWindowManager.showWindow(GameInstance.uiInstance.ynJinxiangPanel);
                        GameInstance.uiInstance.ynJinxiangPanel.setType(2);
                     }
                  }
                  else if(type == NpcFunctionType.YUENAN_SHANGJIAOFANGUO)
                  {
                     this.sender.send_53095([27]);
                  }
                  else if(type == NpcFunctionType.YUENAN_ZHUZHUIDUIHUAN)
                  {
                     this.sender.send_53095([29]);
                  }
                  else if(type == NpcFunctionType.YUENAN_GANENJIJIE)
                  {
                     this.sender.send_53095([33]);
                  }
                  else if(type == NpcFunctionType.YUENAN_ZHAISHUIGUO)
                  {
                     if(!Fun.isVisible(GameInstance.uiInstance.ynJinxiangPanel))
                     {
                        POPWindowManager.showWindow(GameInstance.uiInstance.ynJinxiangPanel);
                        GameInstance.uiInstance.ynJinxiangPanel.setType(3);
                     }
                  }
                  else if(type == NpcFunctionType.YUENAN_DUANWUJIEYANHUI)
                  {
                     if(!Fun.isVisible(GameInstance.uiInstance.ynJinxiangPanel))
                     {
                        POPWindowManager.showWindow(GameInstance.uiInstance.ynJinxiangPanel);
                        GameInstance.uiInstance.ynJinxiangPanel.setType(4);
                     }
                  }
                  else if(type == NpcFunctionType.YUENAN_SHANGXIANGQIFU)
                  {
                     if(!Fun.isVisible(GameInstance.uiInstance.ynQifuPanel))
                     {
                        POPWindowManager.showWindow(GameInstance.uiInstance.ynQifuPanel);
                        GameInstance.uiInstance.ynQifuPanel.setType(5);
                     }
                  }
                  else if(type == NpcFunctionType.YUENAN_JIAOMEIGUI)
                  {
                     if(!Fun.isVisible(GameInstance.uiInstance.ynCommitPanel))
                     {
                        POPWindowManager.showWindow(GameInstance.uiInstance.ynCommitPanel);
                        arr = ["723279,27"];
                        GameInstance.uiInstance.ynCommitPanel.setData(arr,36);
                     }
                  }
                  else if(type == NpcFunctionType.YUENAN_SONGHUAZHIEN)
                  {
                     if(!Fun.isVisible(GameInstance.uiInstance.ynCommitPanel))
                     {
                        POPWindowManager.showWindow(GameInstance.uiInstance.ynCommitPanel);
                        arr = ["723279,27","723280,7"];
                        GameInstance.uiInstance.ynCommitPanel.setData(arr,37);
                     }
                  }
                  else if(type == NpcFunctionType.YUENAN_GUOQINGLIBAO)
                  {
                     this.sender.send_53095([38]);
                  }
                  else if(type == NpcFunctionType.YUENAN_GUOQINGCANZHUO)
                  {
                     if(!Fun.isVisible(GameInstance.uiInstance.ynJinxiangPanel))
                     {
                        POPWindowManager.showWindow(GameInstance.uiInstance.ynJinxiangPanel);
                        GameInstance.uiInstance.ynJinxiangPanel.setType(6);
                     }
                  }
                  else if(type == NpcFunctionType.YUENAN_SHENGDANCANZHUO2015)
                  {
                     if(!Fun.isVisible(GameInstance.uiInstance.ynJinxiangPanel))
                     {
                        POPWindowManager.showWindow(GameInstance.uiInstance.ynJinxiangPanel);
                        GameInstance.uiInstance.ynJinxiangPanel.setType(7);
                     }
                  }
                  else if(type == NpcFunctionType.YUENAN_2016XINNIANCANZHUO)
                  {
                     if(!Fun.isVisible(GameInstance.uiInstance.ynJinxiangPanel))
                     {
                        POPWindowManager.showWindow(GameInstance.uiInstance.ynJinxiangPanel);
                        GameInstance.uiInstance.ynJinxiangPanel.setType(8);
                     }
                  }
                  else if(type == NpcFunctionType.YUENAN_HESUIGUO)
                  {
                     this.sender.send_53097();
                  }
                  else if(type == NpcFunctionType.YUENAN_HOUNIANCHENGHAO)
                  {
                     this.sender.send_53095([55]);
                  }
                  else if(type == NpcFunctionType.YUENAN_HOUNIANZHUFU)
                  {
                     this.sender.send_53095([56]);
                  }
                  else if(type == NpcFunctionType.YUENAN_MEIHUAZHUFU)
                  {
                     this.sender.send_53095([57]);
                  }
                  else if(type == NpcFunctionType.YUENAN_TAOHUAZHUFU)
                  {
                     this.sender.send_53095([58]);
                  }
                  else if(type == NpcFunctionType.YUENAN_ZHUAYUHUODONG)
                  {
                     PipeManager.sendMsg(PipeConstants.SHOW_YNZHUADAYUPANEL);
                  }
                  else if(type == NpcFunctionType.YUENAN_2016GUOQING)
                  {
                     PipeManager.sendMsg(PipeConstants.SEND_53095,[73]);
                  }
                  else if(type == NpcFunctionType.YUENAN_2016JIEJILIANGCAO)
                  {
                     if(!Fun.isVisible(GameInstance.uiInstance.yn2016JieJiLiangCaoPanel))
                     {
                        UITools.showPanel(GameInstance.uiInstance.yn2016JieJiLiangCaoPanel);
                     }
                  }
                  else if(type == NpcFunctionType.YUENAN_2016ERTONGJIECHENGHAO)
                  {
                     PipeManager.sendMsg(PipeConstants.YN_REQUEST_HUODONG_PANEL,45);
                  }
                  else if(type == NpcFunctionType.YUENAN_2016CAISETANGGUO)
                  {
                     PipeManager.sendMsg(PipeConstants.YN_REQUEST_HUODONG_PANEL,44);
                  }
                  else if(type == NpcFunctionType.YUENAN_2016MENGZHUZHUFU)
                  {
                     this.sender.send_53095([78]);
                  }
                  else if(type == NpcFunctionType.YUENAN_2016JINQIANSHU)
                  {
                     this.sender.send_81661();
                  }
                  else if(type == NpcFunctionType.YUENAN_2016GUOQINGZENGSONGWUPIN)
                  {
                     if(!Fun.isVisible(GameInstance.uiInstance.yntijiaowupinPanel))
                     {
                        UITools.showPanel(GameInstance.uiInstance.yntijiaowupinPanel);
                     }
                  }
                  else if(type == NpcFunctionType.YUENAN_20160921MIANFEIHUODONG)
                  {
                     if(!Fun.isVisible(GameInstance.uiInstance.ynqicaitijiaowupinPanel))
                     {
                        UITools.showPanel(GameInstance.uiInstance.ynqicaitijiaowupinPanel);
                     }
                  }
                  else if(type == NpcFunctionType.YUENAN_20160921MIANFEIHUODONGPAIHANG)
                  {
                     PipeManager.sendMsg(PipeConstants.SHOW_YN2016QICAIPAIHANGBANG);
                  }
                  else if(type == NpcFunctionType.YUENAN_20161026KUAILECANZHUO)
                  {
                     onEnterFarme2 = function(param1:Event):void
                     {
                        if(time)
                        {
                           time.stop();
                           time.removeEventListener(TimerEvent.TIMER_COMPLETE,onEnterFarme2);
                           time = null;
                           KeyboardManager.enable = true;
                           GameInstance.app.mouseEnabled = GameInstance.app.mouseChildren = true;
                           sender.send_53095([91]);
                        }
                     };
                     KeyboardManager.enable = false;
                     GameInstance.app.mouseEnabled = GameInstance.app.mouseChildren = false;
                     ti = 30 * 1000;
                     time = new Timer(ti,1);
                     time.start();
                     SmallLoadingBar.close();
                     SynthesizeMsg.SynthesizeSmallLoadingBarMsg = LanResManager.getLanCommonTextWords("快乐餐桌");
                     SmallLoadingBar.showLoading(SynthesizeMsg.SynthesizeSmallLoadingBarMsg,ti);
                     time.addEventListener(TimerEvent.TIMER_COMPLETE,onEnterFarme2);
                  }
                  else if(type == NpcFunctionType.YUENAN_20161207XIAOHUISHENQI)
                  {
                     if(!Fun.isVisible(GameInstance.uiInstance.ynxiaohuishenbingPanel))
                     {
                        UITools.showPanel(GameInstance.uiInstance.ynxiaohuishenbingPanel);
                        GameInstance.uiInstance.ynxiaohuishenbingPanel.setData();
                     }
                  }
                  else if(type == NpcFunctionType.YUENAN_20161220SHENGDANZHUOZI)
                  {
                     onEnterFarme3 = function(param1:Event):void
                     {
                        if(time)
                        {
                           time.stop();
                           time.removeEventListener(TimerEvent.TIMER_COMPLETE,onEnterFarme3);
                           time = null;
                           KeyboardManager.enable = true;
                           GameInstance.app.mouseEnabled = GameInstance.app.mouseChildren = true;
                           sender.send_53095([98]);
                        }
                     };
                     KeyboardManager.enable = false;
                     GameInstance.app.mouseEnabled = GameInstance.app.mouseChildren = false;
                     ti = 30 * 1000;
                     time = new Timer(ti,1);
                     time.start();
                     SmallLoadingBar.close();
                     SynthesizeMsg.SynthesizeSmallLoadingBarMsg = LanResManager.getLanCommonTextWords("圣诞桌子");
                     SmallLoadingBar.showLoading(SynthesizeMsg.SynthesizeSmallLoadingBarMsg,ti);
                     time.addEventListener(TimerEvent.TIMER_COMPLETE,onEnterFarme3);
                  }
                  else if(type == NpcFunctionType.YUENAN_2017XINNIANCHENGHAO)
                  {
                     this.sender.send_53095([103]);
                  }
                  else if(type == NpcFunctionType.YUENAN_2017ZHUFU)
                  {
                     this.sender.send_53095([104]);
                  }
                  else if(type == NpcFunctionType.YUENAN_2017YINSHOUTAO)
                  {
                     this.sender.send_53095([106]);
                  }
                  else if(type == NpcFunctionType.YUENAN_2017JUEQINGDAN)
                  {
                     this.sender.send_53095([107]);
                  }
                  else if(type == NpcFunctionType.YUENAN_2017YANHUIZHUO)
                  {
                     this.sender.send_53095([117]);
                  }
                  else if(type == NpcFunctionType.YUENAN_2017DUIHUANDAMOCAILIAO)
                  {
                     this.sender.send_53095([123]);
                  }
                  else if(type == NpcFunctionType.YUENAN_2017LINGQUXUEMOZHANCHANGLING)
                  {
                     this.sender.send_53099([12]);
                  }
                  else if(type == NpcFunctionType.YUENAN_2017HUADENGLINGJIANG_DONG || type == NpcFunctionType.YUENAN_2017HUADENGLINGJIANG_XI || type == NpcFunctionType.YUENAN_2017HUADENGLINGJIANG_NAN || type == NpcFunctionType.YUENAN_2017HUADENGLINGJIANG_BEI)
                  {
                     onEnterFarme4 = function(param1:Event):void
                     {
                        var _loc2_:int = 0;
                        if(time)
                        {
                           time.stop();
                           time.removeEventListener(TimerEvent.TIMER_COMPLETE,onEnterFarme4);
                           time = null;
                           KeyboardManager.enable = true;
                           GameInstance.app.mouseEnabled = GameInstance.app.mouseChildren = true;
                           if(type == NpcFunctionType.YUENAN_2017HUADENGLINGJIANG_DONG)
                           {
                              _loc2_ = 1;
                           }
                           else if(type == NpcFunctionType.YUENAN_2017HUADENGLINGJIANG_XI)
                           {
                              _loc2_ = 2;
                           }
                           else if(type == NpcFunctionType.YUENAN_2017HUADENGLINGJIANG_NAN)
                           {
                              _loc2_ = 3;
                           }
                           else
                           {
                              _loc2_ = 4;
                           }
                           PipeManager.sendMsg(PipeConstants.SEND_53099,[36,_loc2_]);
                        }
                     };
                     KeyboardManager.enable = false;
                     GameInstance.app.mouseEnabled = GameInstance.app.mouseChildren = false;
                     ti = 30 * 1000;
                     time = new Timer(ti,1);
                     time.start();
                     SmallLoadingBar.close();
                     SynthesizeMsg.SynthesizeSmallLoadingBarMsg = "";
                     SmallLoadingBar.showLoading(SynthesizeMsg.SynthesizeSmallLoadingBarMsg,ti);
                     time.addEventListener(TimerEvent.TIMER_COMPLETE,onEnterFarme4);
                  }
                  else if(type == NpcFunctionType.YUENAN_2017LINGQUTIANMODAN)
                  {
                     arr = GameInstance.mainCharData.goodsInfo.getGoodsArrByID(727589,true);
                     if(arr.length > 0)
                     {
                        goods = arr[0];
                        this.sender.send_53099([23,goods.id,goods.position]);
                     }
                     else
                     {
                        NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("包裹中天魔丹不足"));
                     }
                  }
                  else if(type == NpcFunctionType.YUENAN_2017SHENGRIDANGAO)
                  {
                     this.sender.send_53099([46]);
                  }
                  else if(type == NpcFunctionType.YUENAN_2017HUANHUASHENGDANZUOQI)
                  {
                     this.sender.send_53099([63]);
                  }
                  else if(type == NpcFunctionType.YUENAN_2017SHENGDANLIBAO)
                  {
                     this.sender.send_53099([64]);
                  }
                  else if(type == NpcFunctionType.YUENAN_2018WUXUNIAN)
                  {
                     this.sender.send_53099([73,1]);
                  }
                  else if(type == NpcFunctionType.YUENAN_2018SHENGXIAOYANG)
                  {
                     this.sender.send_53099([73,2]);
                  }
                  else if(type == NpcFunctionType.YUENAN_20187SHENGXIAOMA)
                  {
                     this.sender.send_53099([73,3]);
                  }
                  else if(type == NpcFunctionType.YUENAN_2018SHENGXIAOHU)
                  {
                     this.sender.send_53099([73,4]);
                  }
                  else if(type == NpcFunctionType.YUENAN_KUAILECANZHUO)
                  {
                     this.sender.send_53099([73,5]);
                  }
                  else if(type == NpcFunctionType.YUENAN_SHUIGUOZHI)
                  {
                     this.sender.send_83021({
                        "type":1,
                        "num":1
                     });
                  }
                  else if(type == NpcFunctionType.YUENAN_SHUIGUOPAN)
                  {
                     UITools.showPanel(GameInstance.uiInstance.shuiGuoLeiJiDuiHuanPanel);
                     GameInstance.uiInstance.shuiGuoLeiJiDuiHuanPanel.setData(2);
                  }
                  else if(type == NpcFunctionType.YUENAN_SHUIGUOLAN)
                  {
                     UITools.showPanel(GameInstance.uiInstance.shuiGuoLeiJiDuiHuanPanel);
                     GameInstance.uiInstance.shuiGuoLeiJiDuiHuanPanel.setData(3);
                  }
                  else if(type == NpcFunctionType.YUENAN_SHENMIBAOXIANG)
                  {
                     this.sender.send_53099([111,1]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NANDEMISHU)
                  {
                     this.sender.send_53099([112,1]);
                  }
                  else if(type == NpcFunctionType.YUENAN_YULANXUYUAN)
                  {
                     this.sender.send_53099([113,1]);
                  }
                  else if(type == NpcFunctionType.YUENAN_YULANZENGSONG)
                  {
                     this.sender.send_53099([114,1]);
                  }
                  else if(type == NpcFunctionType.YUENAN_YULANCHENGHAO)
                  {
                     this.sender.send_53099([118,1]);
                  }
                  else if(type == NpcFunctionType.YUENAN_YULANWAIZHUANG)
                  {
                     this.sender.send_53099([119,1]);
                  }
                  else if(type == NpcFunctionType.YUENAN_LINGQUHUADENG)
                  {
                     this.sender.send_53099([115,1]);
                  }
                  else if(type == NpcFunctionType.YUENAN_2016GUOQINGLIBAO)
                  {
                     this.sender.send_53099([122,1]);
                  }
                  else if(type == NpcFunctionType.YUENAN_2016GUOQINGYAN)
                  {
                     this.sender.send_53099([123,1]);
                  }
                  else if(type == NpcFunctionType.YUENAN_20180903MIANFEILINGQU)
                  {
                     this.sender.send_53099([125,1]);
                  }
                  else if(type == NpcFunctionType.YUENAN_20180903500YUANBAOLINGQU)
                  {
                     this.sender.send_53099([126,1]);
                  }
                  else if(type == NpcFunctionType.YUENAN_20180918YUEBINGGOUMAI)
                  {
                     this.sender.send_53099([130,1]);
                  }
                  else if(type == NpcFunctionType.YUENAN_20180918TUANYUANCHENGHAO)
                  {
                     this.sender.send_53099([130,2]);
                  }
                  else if(type == NpcFunctionType.YUENAN_20180918ZHONGQIUSHIZHUANG)
                  {
                     this.sender.send_53099([130,3]);
                  }
                  else if(type == NpcFunctionType.YUENAN_20180918SHANGYUEHUODONG)
                  {
                     this.sender.send_53099([130,4]);
                  }
                  else if(type == NpcFunctionType.YUENAN_20180918ZHONGQIUMIANFEILIBAO)
                  {
                     this.sender.send_53099([130,5]);
                  }
                  else if(type == NpcFunctionType.YUENAN_20181010JINGJIUMINGZHU)
                  {
                     this.sender.send_53099([142,1]);
                  }
                  else if(type == NpcFunctionType.YUENAN_20181010JIANGHUFULI)
                  {
                     this.sender.send_53099([142,2]);
                  }
                  else if(type == NpcFunctionType.YUENAN_20181010XINSHOULINGJIANG)
                  {
                     this.sender.send_53099([142,3]);
                  }
                  else if(type == NpcFunctionType.YUENAN_20181010YINGXIONGJIANGLI)
                  {
                     this.sender.send_53099([142,4]);
                  }
                  else if(type == NpcFunctionType.YUENAN_20181010DUANLIANLIWU)
                  {
                     this.sender.send_53099([142,5]);
                  }
                  else if(type == NpcFunctionType.YUENAN_20181106QINIANKUAILE)
                  {
                     this.sender.send_53099([155,1]);
                  }
                  else if(type == NpcFunctionType.YUENAN_20181106SHENGRIKUAILE)
                  {
                     this.sender.send_53099([155,2]);
                  }
                  else if(type == NpcFunctionType.YUENAN_20181106JIXIANGLIWU)
                  {
                     this.sender.send_53099([155,3]);
                  }
                  else if(type == NpcFunctionType.YUENAN_20181106BAOWUJINGLIAN)
                  {
                     this.sender.send_53099([155,4]);
                  }
                  else if(type == NpcFunctionType.YUENAN_20181106JIPINLIBAO)
                  {
                     this.sender.send_53099([155,5]);
                  }
                  else if(type == NpcFunctionType.YUENAN_20181106TEBIEBANBENZENGSONG)
                  {
                     this.sender.send_53099([161,1]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE01)
                  {
                     this.sender.send_53099([162,1]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE02)
                  {
                     this.sender.send_53099([162,2]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE03)
                  {
                     this.sender.send_53099([162,3]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE04)
                  {
                     this.sender.send_53099([162,4]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE05)
                  {
                     this.sender.send_53099([168,1]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE06)
                  {
                     this.sender.send_53099([168,2]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE07)
                  {
                     this.sender.send_53099([168,3]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE08)
                  {
                     this.sender.send_53099([168,4]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE09)
                  {
                     PipeManager.sendMsg(PipeConstants.NPC_REQ_FUNCTION,NpcFunctionType.YUENAN_ZHIZUOZONGZI);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE10)
                  {
                     this.sender.send_53099([193,2]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE11)
                  {
                     this.sender.send_53099([193,3]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE12)
                  {
                     this.sender.send_53099([193,4]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE15)
                  {
                     this.sender.send_53099([208,1]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE16)
                  {
                     FAlert.okLabel = LanResManager.getLanCommonTextWords("是");
                     FAlert.cancelLabel = LanResManager.getLanCommonTextWords("否");
                     FAlert.show(LanResManager.getLanCommonTextWords("是否同意购买花灯？"),"",2,function(param1:FAlertEvent):void
                     {
                        if(param1.eventData == FAlert.OK)
                        {
                           sender.send_53099([208,2]);
                        }
                     });
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE17)
                  {
                     FAlert.okLabel = LanResManager.getLanCommonTextWords("是");
                     FAlert.cancelLabel = LanResManager.getLanCommonTextWords("否");
                     FAlert.show(LanResManager.getLanCommonTextWords("是否同意购买花灯？"),"",2,function(param1:FAlertEvent):void
                     {
                        if(param1.eventData == FAlert.OK)
                        {
                           sender.send_53099([208,3]);
                        }
                     });
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE18)
                  {
                     FAlert.okLabel = LanResManager.getLanCommonTextWords("是");
                     FAlert.cancelLabel = LanResManager.getLanCommonTextWords("否");
                     FAlert.show(LanResManager.getLanCommonTextWords("是否同意购买花灯？"),"",2,function(param1:FAlertEvent):void
                     {
                        if(param1.eventData == FAlert.OK)
                        {
                           sender.send_53099([208,4]);
                        }
                     });
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE20)
                  {
                     this.sender.send_53099([238,1]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE21)
                  {
                     this.sender.send_53099([238,2]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE22)
                  {
                     this.sender.send_53099([238,3]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE23)
                  {
                     this.sender.send_53099([240,1]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE24)
                  {
                     this.sender.send_53099([240,2]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE25)
                  {
                     this.sender.send_53099([240,3]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE26)
                  {
                     this.sender.send_53099([242,1]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE27)
                  {
                     this.sender.send_53099([242,2]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE28)
                  {
                     this.sender.send_53099([242,3]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE29)
                  {
                     this.sender.send_53099([242,4]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE30)
                  {
                     this.sender.send_53099([242,5]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE31)
                  {
                     this.sender.send_53099([253,1]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE32)
                  {
                     this.sender.send_53099([253,2]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE33)
                  {
                     this.sender.send_53099([273,1]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE34)
                  {
                     this.sender.send_53099([273,2]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE35)
                  {
                     this.sender.send_53099([274,1]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE36)
                  {
                     this.sender.send_53099([274,2]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE37)
                  {
                     this.sender.send_53099([274,3]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE38)
                  {
                     UITools.showPanel(GameInstance.uiInstance.zhuangBeiHuanYuanPanel);
                     GameInstance.uiInstance.zhuangBeiHuanYuanPanel.setData();
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE39)
                  {
                     this.sender.send_53099([318,1]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE40)
                  {
                     this.sender.send_53099([318,2]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE41)
                  {
                     this.sender.send_53099([318,3]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE42)
                  {
                     this.sender.send_53099([320,1]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE43)
                  {
                     this.sender.send_53099([320,2]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE44)
                  {
                     PipeManager.sendMsg(PipeConstants.NPC_REQ_FUNCTION,NpcFunctionType.YUENAN_ZHIZUOZONGZI);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE45)
                  {
                     this.sender.send_53099([321,1]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE46)
                  {
                     this.sender.send_53099([322,2]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE47)
                  {
                     this.sender.send_53099([323,3]);
                  }
                  else if(type == NpcFunctionType.YUENAN_NPCFUNCTIONTYPE48)
                  {
                     this.sender.send_53099([324,4]);
                  }
               }
               break;
            case Npc_ApplicationFacade.FENGZHENGJIEDUIHUAN_CLICK:
               this.sender.send_53095([5,String(noteBody)]);
               break;
            case Npc_ApplicationFacade.SEND_RENAME:
               name = String(noteBody);
               this.sender.send_53095([6,name]);
               break;
            case Npc_ApplicationFacade.SEND_NPCID:
               npcChar = noteBody as SceneCharacter;
               this.npcID = npcChar.id;
               break;
            case Npc_ApplicationFacade.SEND_YUENANAOJIANHECHENG:
               this.sender.send_53095([8]);
               break;
            case Npc_ApplicationFacade.SEND_YUENANGOODDELETE:
               ar = noteBody as Array;
               this.sender.send_53095([9,ar[0],ar[1]]);
               break;
            case Npc_ApplicationFacade.SEND_53095:
               this.sender.send_53095(noteBody);
               break;
            case Npc_ApplicationFacade.SEND_83205:
               this.sender.send_83205(noteBody as Array);
               break;
            case Npc_ApplicationFacade.SEND_53099:
               this.sender.send_53099(noteBody);
               break;
            case Npc_ApplicationFacade.SEND_82241:
               this.sender.send_82241();
               break;
            case Npc_ApplicationFacade.YN_WUPINFENJIE:
               go = noteBody as Goods;
               if(go.res)
               {
                  str = LanResManager.getLanCommonTextWords("进行分解将会获得：傲神装备碎片*1");
                  FAlert.okLabel = LanResManager.getLanCommonTextWords("分解");
                  FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
                  FAlert.show(str,LanResManager.getLanCommonTextWords("装备分解"),2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        sender.send_53095([25,go.id]);
                     }
                  },true);
               }
               break;
            case Npc_ApplicationFacade.YN_REQUEST_JINXIANG:
               ty = int(noteBody);
               if(ty == 1)
               {
                  this.sender.send_53095([26]);
               }
               else if(ty == 2)
               {
                  this.sender.send_53095([28]);
               }
               else if(ty == 3)
               {
                  this.sender.send_53095([32]);
               }
               else if(ty == 4)
               {
                  this.sender.send_53095([30]);
               }
               else if(ty == 5)
               {
                  this.sender.send_53095([35]);
               }
               else if(ty == 6)
               {
                  this.sender.send_53095([39]);
               }
               else if(ty == 7)
               {
                  this.sender.send_53095([46]);
               }
               else if(ty == 8)
               {
                  this.sender.send_53095([53]);
               }
               break;
            case Npc_ApplicationFacade.YN_REQUEST_MUYUHU_START:
               n = int(noteBody);
               if(n == 1)
               {
                  this.sender.send_53095([34]);
               }
               else if(n == 2)
               {
                  this.sender.send_53095([77]);
               }
               else if(n == 3)
               {
                  this.sender.send_53099([210,1]);
               }
               else if(n == 4)
               {
                  this.sender.send_53099([335,1]);
               }
               break;
            case Npc_ApplicationFacade.YN_REQUEST_BAOSHU_START:
               id = (noteBody as SceneCharacter).id;
               SmallLoadingBar.showLoading(LanResManager.getLanTextWords(this,"采集中"),10000);
               this.sender.send_83217([id]);
               break;
            case Npc_ApplicationFacade.YN_REQUEST_YUENAN2015ZHONGQIU:
               if(!Fun.isVisible(GameInstance.uiInstance.yn2015zhongqiuPanel))
               {
                  GameInstance.uiInstance.yn2015zhongqiuPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.yn2015zhongqiuPanel.width / 2;
                  GameInstance.uiInstance.yn2015zhongqiuPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.yn2015zhongqiuPanel.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.yn2015zhongqiuPanel);
               }
               GameInstance.uiInstance.yn2015zhongqiuPanel.setScore(int(noteBody));
               break;
            case Npc_ApplicationFacade.YN_CHONGZHIPANEL:
               player = GameInstance.mainCharData.attributeInfo;
               ExternalInterface.call("showPopup",player.ynPingtai,player.ynServerID,player.ynName);
               break;
            case Npc_ApplicationFacade.YN_SHOW_CHRISTMAS_2015:
               if(!Fun.isVisible(GameInstance.uiInstance.ynChristmasPanel))
               {
                  GameInstance.uiInstance.ynChristmasPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.ynChristmasPanel.width / 2;
                  GameInstance.uiInstance.ynChristmasPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.ynChristmasPanel.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.ynChristmasPanel);
               }
               break;
            case Npc_ApplicationFacade.SHOW_YNQIANGHUAZHISHEN_PANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.ynQianghuazhishenPanel))
               {
                  GameInstance.uiInstance.ynQianghuazhishenPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.ynQianghuazhishenPanel.width / 2;
                  GameInstance.uiInstance.ynQianghuazhishenPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.ynQianghuazhishenPanel.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.ynQianghuazhishenPanel);
               }
               break;
            case Npc_ApplicationFacade.SHOW_YNXINNIANZHUFUPANEL:
               this.showZhufUPanel(-2);
               break;
            case Npc_ApplicationFacade.SHOW_YN2016TIANDENG:
               if(!Fun.isVisible(GameInstance.uiInstance.ynFangshengliyuPanel))
               {
                  GameInstance.uiInstance.ynFangshengliyuPanel.setBtn(true);
                  POPWindowManager.showWindow(GameInstance.uiInstance.ynFangshengliyuPanel);
               }
               break;
            case Npc_ApplicationFacade.SHOW_YN2016SHIERDIZHI:
               if(!Fun.isVisible(GameInstance.uiInstance.ynShierdizhiPanel))
               {
                  GameInstance.uiInstance.ynShierdizhiPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.ynShierdizhiPanel.width / 2;
                  GameInstance.uiInstance.ynShierdizhiPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.ynShierdizhiPanel.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.ynShierdizhiPanel);
               }
               break;
            case Npc_ApplicationFacade.SHOW_YNSHANXIAQIJIAN:
               if(!Fun.isVisible(GameInstance.uiInstance.ynShanxiaqijianPanel))
               {
                  GameInstance.uiInstance.ynShanxiaqijianPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.ynShanxiaqijianPanel.width / 2;
                  GameInstance.uiInstance.ynShanxiaqijianPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.ynShanxiaqijianPanel.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.ynShanxiaqijianPanel);
               }
               break;
            case Npc_ApplicationFacade.SHOW_YNLUOHANHUTI:
               if(!Fun.isVisible(GameInstance.uiInstance.ynLuohanhutiPanel))
               {
                  GameInstance.uiInstance.ynLuohanhutiPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.ynLuohanhutiPanel.width / 2;
                  GameInstance.uiInstance.ynLuohanhutiPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.ynLuohanhutiPanel.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.ynLuohanhutiPanel);
               }
               break;
            case Npc_ApplicationFacade.SHOW_YNSHOUYIN:
               if(!Fun.isVisible(GameInstance.uiInstance.ynShouyinPanel))
               {
                  GameInstance.uiInstance.ynShouyinPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.ynShouyinPanel.width / 2;
                  GameInstance.uiInstance.ynShouyinPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.ynShouyinPanel.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.ynShouyinPanel);
               }
               break;
            case Npc_ApplicationFacade.SHOW_QIZIQUANZHENJIAO:
               if(!Fun.isVisible(GameInstance.uiInstance.ynQiziquanzhenPanel))
               {
                  GameInstance.uiInstance.ynQiziquanzhenPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.ynQiziquanzhenPanel.width / 2;
                  GameInstance.uiInstance.ynQiziquanzhenPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.ynQiziquanzhenPanel.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.ynQiziquanzhenPanel);
               }
               break;
            case Npc_ApplicationFacade.SHOW_2016XIUWEIWUXUE:
               if(!Fun.isVisible(GameInstance.uiInstance.ynxiuweiwuxuePanel))
               {
                  GameInstance.uiInstance.ynxiuweiwuxuePanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.ynxiuweiwuxuePanel.width / 2;
                  GameInstance.uiInstance.ynxiuweiwuxuePanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.ynxiuweiwuxuePanel.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.ynxiuweiwuxuePanel);
               }
               break;
            case Npc_ApplicationFacade.SHOW_YN2016LIUMAIJIANPLANE:
               if(!Fun.isVisible(GameInstance.uiInstance.ynliumaijianPanel))
               {
                  GameInstance.uiInstance.ynliumaijianPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.ynliumaijianPanel.width / 2;
                  GameInstance.uiInstance.ynliumaijianPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.ynliumaijianPanel.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.ynliumaijianPanel);
               }
               break;
            case Npc_ApplicationFacade.SHOW_ZHENTIANSHENQIPLANE:
               id = int(noteBody);
               if(!Fun.isVisible(GameInstance.uiInstance.ynzhentianshenqiPanel))
               {
                  GameInstance.uiInstance.ynzhentianshenqiPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.ynzhentianshenqiPanel.width / 2;
                  GameInstance.uiInstance.ynzhentianshenqiPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.ynzhentianshenqiPanel.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.ynzhentianshenqiPanel);
               }
               GameInstance.uiInstance.ynzhentianshenqiPanel.init(id);
               break;
            case Npc_ApplicationFacade.SHOW_YN2016WANGZHEZHANQI:
               if(!Fun.isVisible(GameInstance.uiInstance.ynwangzhezhanqiPanel))
               {
                  GameInstance.uiInstance.ynwangzhezhanqiPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.ynwangzhezhanqiPanel.width / 2;
                  GameInstance.uiInstance.ynwangzhezhanqiPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.ynwangzhezhanqiPanel.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.ynwangzhezhanqiPanel);
               }
               break;
            case Npc_ApplicationFacade.SHOW_YNNVQUANHUODONG:
               if(!Fun.isVisible(GameInstance.uiInstance.ynNvquanPanel))
               {
                  GameInstance.uiInstance.ynNvquanPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.ynNvquanPanel.width / 2;
                  GameInstance.uiInstance.ynNvquanPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.ynNvquanPanel.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.ynNvquanPanel);
               }
               break;
            case Npc_ApplicationFacade.SHOW_YNWULINSHENQIPANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.ynWulinshenqiPanel))
               {
                  GameInstance.uiInstance.ynWulinshenqiPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.ynWulinshenqiPanel.width / 2;
                  GameInstance.uiInstance.ynWulinshenqiPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.ynWulinshenqiPanel.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.ynWulinshenqiPanel);
               }
               break;
            case Npc_ApplicationFacade.SHOW_YNJUEDINGSHENBINGPANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.ynJuedingshenbingPanel))
               {
                  GameInstance.uiInstance.ynJuedingshenbingPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.ynJuedingshenbingPanel.width / 2;
                  GameInstance.uiInstance.ynJuedingshenbingPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.ynJuedingshenbingPanel.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.ynJuedingshenbingPanel);
               }
               break;
            case Npc_ApplicationFacade.SHOW_YNHUTISHANGYIPANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.ynHutishangyiPanel))
               {
                  GameInstance.uiInstance.ynHutishangyiPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.ynHutishangyiPanel.width / 2;
                  GameInstance.uiInstance.ynHutishangyiPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.ynHutishangyiPanel.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.ynHutishangyiPanel);
               }
               break;
            case Npc_ApplicationFacade.SHOW_YNWUSHUANGPUPANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.ynWushuangPanel))
               {
                  GameInstance.uiInstance.ynWushuangPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.ynWushuangPanel.width / 2;
                  GameInstance.uiInstance.ynWushuangPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.ynWushuangPanel.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.ynWushuangPanel);
               }
               break;
            case Npc_ApplicationFacade.SHOW_YNSHISANJIANHUN:
               if(!Fun.isVisible(GameInstance.uiInstance.ynShisanjianhunPanel))
               {
                  GameInstance.uiInstance.ynShisanjianhunPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.ynShisanjianhunPanel.width / 2;
                  GameInstance.uiInstance.ynShisanjianhunPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.ynShisanjianhunPanel.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.ynShisanjianhunPanel);
               }
               break;
            case Npc_ApplicationFacade.SHOW_WANGZHEZHUANGBEI:
               type = int(noteBody);
               switch(type)
               {
                  case 1:
                     if(!Fun.isVisible(GameInstance.uiInstance.ynwangzhezhuangbeiPanel))
                     {
                        GameInstance.uiInstance.ynwangzhezhuangbeiPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.ynwangzhezhuangbeiPanel.width / 2;
                        GameInstance.uiInstance.ynwangzhezhuangbeiPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.ynwangzhezhuangbeiPanel.height / 2;
                        GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.ynwangzhezhuangbeiPanel);
                     }
                     break;
                  case 2:
                     if(!Fun.isVisible(GameInstance.uiInstance.$baguajingshiPanel))
                     {
                        GameInstance.uiInstance.$baguajingshiPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.$baguajingshiPanel.width / 2;
                        GameInstance.uiInstance.$baguajingshiPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.$baguajingshiPanel.height / 2;
                        GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.$baguajingshiPanel);
                     }
                     break;
                  case 3:
                     if(!Fun.isVisible(GameInstance.uiInstance.$longlishiPanel))
                     {
                        GameInstance.uiInstance.$longlishiPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.$longlishiPanel.width / 2;
                        GameInstance.uiInstance.$longlishiPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.$longlishiPanel.height / 2;
                        GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.$longlishiPanel);
                     }
                     break;
                  case 4:
                     if(!Fun.isVisible(GameInstance.uiInstance.$qianghuazhishenPanel))
                     {
                        GameInstance.uiInstance.$qianghuazhishenPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.$qianghuazhishenPanel.width / 2;
                        GameInstance.uiInstance.$qianghuazhishenPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.$qianghuazhishenPanel.height / 2;
                        GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.$qianghuazhishenPanel);
                     }
                     break;
                  case 5:
                     if(!Fun.isVisible(GameInstance.uiInstance.$xiangyangduijuePanel))
                     {
                        GameInstance.uiInstance.$xiangyangduijuePanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.$xiangyangduijuePanel.width / 2;
                        GameInstance.uiInstance.$xiangyangduijuePanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.$xiangyangduijuePanel.height / 2;
                        GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.$xiangyangduijuePanel);
                     }
                     break;
                  case 6:
                     if(!Fun.isVisible(GameInstance.uiInstance.$wulinwujuedanPanel))
                     {
                        GameInstance.uiInstance.$wulinwujuedanPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.$wulinwujuedanPanel.width / 2;
                        GameInstance.uiInstance.$wulinwujuedanPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.$wulinwujuedanPanel.height / 2;
                        GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.$wulinwujuedanPanel);
                     }
               }
               break;
            case Npc_ApplicationFacade.SHOW_HUAZHUANGLIBAO_PANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.$huazhuanglibaoPanel))
               {
                  GameInstance.uiInstance.$huazhuanglibaoPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.$huazhuanglibaoPanel.width / 2;
                  GameInstance.uiInstance.$huazhuanglibaoPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.$huazhuanglibaoPanel.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.$huazhuanglibaoPanel);
               }
               break;
            case Npc_ApplicationFacade.SHOW_CHIBANGLIBAO_PANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.$chibanglibaoPanel))
               {
                  GameInstance.uiInstance.$chibanglibaoPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.$chibanglibaoPanel.width / 2;
                  GameInstance.uiInstance.$chibanglibaoPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.$chibanglibaoPanel.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.$chibanglibaoPanel);
               }
         }
      }
      
      protected function get zhufu() : XinnianZhufuPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.xinnianzhufu);
         }
         return viewComponent as XinnianZhufuPanel;
      }
      
      public function get sender() : Npc_MsgSenderProxy
      {
         if(this._sender == null)
         {
            this._sender = facade.retrieveProxy(Npc_MsgSenderProxy.NAME) as Npc_MsgSenderProxy;
         }
         return this._sender;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(XinnianZhufuPanel,function():void
         {
            zhufu.addEventListener(XinnianZhufuPanel.XINCHUNZHUFU,onHandl);
         });
         UIEventsRegisterManager.addUIRemovedEvent(XinnianZhufuPanel,function():void
         {
            zhufu.removeEventListener(XinnianZhufuPanel.XINCHUNZHUFU,onHandl);
         });
         UIEventsRegisterManager.addUIRegisterEvent(ShuiGuoLeiJiDuiHuanPanel,function():void
         {
            GameInstance.uiInstance.shuiGuoLeiJiDuiHuanPanel.addEventListener(ShuiGuoLeiJiDuiHuanPanel.SHUIGUOLEIJI_DUIHUA_CLICK,onHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ShuiGuoLeiJiDuiHuanPanel,function():void
         {
            GameInstance.uiInstance.shuiGuoLeiJiDuiHuanPanel.removeEventListener(ShuiGuoLeiJiDuiHuanPanel.SHUIGUOLEIJI_DUIHUA_CLICK,onHandler);
         });
      }
      
      private function onHandler(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case ShuiGuoLeiJiDuiHuanPanel.SHUIGUOLEIJI_DUIHUA_CLICK:
               this.sender.send_83021(_loc2_.data as Object);
         }
      }
      
      public function onHandl(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:Array = null;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               break;
            case XinnianZhufuPanel.XINCHUNZHUFU:
               _loc2_ = param1 as BaseEvent;
               _loc3_ = _loc2_.data as Array;
               _loc4_ = String(_loc3_[0]);
               _loc5_ = int(_loc3_[1]);
               if(_loc5_ == -1)
               {
                  this.sender.send_53095([3,_loc4_]);
               }
               else if(_loc5_ == -2)
               {
                  this.sender.send_53095([60,_loc4_]);
               }
               else
               {
                  this.sender.send_53095([22,_loc5_,_loc4_]);
               }
               this.closePanel();
         }
      }
      
      public function showZhufUPanel(param1:int = -1) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.xinnianzhufu))
         {
            POPWindowManager.showWindow(GameInstance.uiInstance.xinnianzhufu);
            GameInstance.uiInstance.xinnianzhufu.setPlayerID(param1);
         }
      }
      
      public function closePanel() : void
      {
         GameInstance.uiInstance.xinnianzhufu.onClose();
      }
      
      public function closeFengzhengjieXunzhangPanel() : void
      {
         GameInstance.uiInstance.fengzhengjiexunzhang.onClose();
      }
      
      public function setYNhesuishu(param1:int) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.ynHesuiPanel))
         {
            GameInstance.uiInstance.ynHesuiPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.ynHesuiPanel.width / 2;
            GameInstance.uiInstance.ynHesuiPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.ynHesuiPanel.height / 2;
            GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.ynHesuiPanel);
         }
         GameInstance.uiInstance.ynHesuiPanel.setData(param1);
      }
      
      public function setYNfangshengliyu() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.ynFangshengliyuPanel))
         {
            POPWindowManager.showWindow(GameInstance.uiInstance.ynFangshengliyuPanel);
            GameInstance.uiInstance.ynFangshengliyuPanel.setBtn(true);
         }
      }
   }
}

