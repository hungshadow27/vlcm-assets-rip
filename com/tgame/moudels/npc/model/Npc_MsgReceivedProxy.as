package com.tgame.moudels.npc.model
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SynthesizeMsg;
   import com.tgame.common.ui.componets.SmallLoadingBar;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.manager.KeyboardManager;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TopTipManager;
   import com.tgame.moudels.login.view.*;
   import com.tgame.moudels.npc.view.Npc_ChuansongMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.display.Bitmap;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import flash.utils.setTimeout;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Npc_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Npc_MsgReceivedProxy";
      
      private var _mediator:Npc_ChuansongMediator;
      
      private var time1:Timer;
      
      private var time2:Timer;
      
      private var time3:Timer;
      
      private var time4:Timer;
      
      private var time5:Timer;
      
      private var _s:int = 60000;
      
      public function Npc_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([52060,53096,80102,53098,80922,83218],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([52060,53096,80102,53098,80922,83218],NAME);
      }
      
      private function receivedMsgHandle(param1:Notification) : void
      {
         var _loc2_:* = param1.name;
         var _loc3_:ByteArray = param1.body as ByteArray;
         if(this.hasOwnProperty("received_" + _loc2_))
         {
            this["received_" + _loc2_](_loc3_);
         }
         else
         {
            ZLog.add("协议号" + _loc2_ + "不存在");
         }
      }
      
      private function get mediator() : Npc_ChuansongMediator
      {
         if(this._mediator == null)
         {
            this._mediator = facade.retrieveMediator(Npc_ChuansongMediator.NAME) as Npc_ChuansongMediator;
         }
         return this._mediator;
      }
      
      public function received_52060(param1:ByteArray) : void
      {
         var _buf:ByteArray;
         var tishi:String;
         var textType:int;
         var tupianBiaoshi:int;
         var headStr:String;
         var npcID:int = 0;
         var compl:Function = null;
         var newBytes:ByteArray = null;
         var load:Loader = null;
         var $data:ByteArray = param1;
         compl = function(param1:Event):void
         {
            var _loc2_:Bitmap = param1.target.content as Bitmap;
            GameInstance.npcTupianTishiDict[npcID] = _loc2_;
         };
         ZLog.add("52060：动态增加NPC提示（任务列表位置）");
         _buf = $data;
         npcID = _buf.readInt();
         tishi = _buf.readUTF();
         textType = _buf.readByte();
         tupianBiaoshi = _buf.readByte();
         if(tupianBiaoshi == 1)
         {
            newBytes = new ByteArray();
            $data.readBytes(newBytes);
            load = new Loader();
            load.loadBytes(newBytes);
            load.contentLoaderInfo.addEventListener(Event.COMPLETE,compl);
         }
         headStr = "";
         switch(textType)
         {
            case 0:
               headStr = "";
               break;
            case 1:
               headStr = LanResManager.getLanCommonTextWords("刺客名字里的一个字") + "：";
               break;
            case 2:
               headStr = LanResManager.getLanCommonTextWords("刺客的所在帮派") + "：";
               break;
            case 3:
               headStr = LanResManager.getLanCommonTextWords("刺客的角色门派") + "：";
               break;
            case 4:
               headStr = LanResManager.getLanCommonTextWords("刺客的等级") + "：";
               break;
            case 5:
               headStr = LanResManager.getLanCommonTextWords("刺客所在的区服") + "：";
         }
         GameInstance.npcTishiDict[npcID] = headStr + tishi;
      }
      
      public function received_53096(param1:ByteArray) : void
      {
         var _buf:ByteArray;
         var type:int = 0;
         var onEnterFarme:Function = null;
         var onEnterFarme2:Function = null;
         var onEnterFarme3:Function = null;
         var onEnterFarme4:Function = null;
         var onEnterFarme5:Function = null;
         var gid:int = 0;
         var day:int = 0;
         var num1:int = 0;
         var num:int = 0;
         var ar:Array = null;
         var o:Object = null;
         var i:int = 0;
         var obj:Object = null;
         var score:int = 0;
         var b:Boolean = false;
         var str:String = null;
         var name:String = null;
         var $data:ByteArray = param1;
         onEnterFarme = function(param1:Event):void
         {
            if(time1)
            {
               time1.stop();
               time1.removeEventListener(TimerEvent.TIMER_COMPLETE,onEnterFarme);
               time1 = null;
            }
            LoadingBar(2);
            time2 = new Timer(_s,1);
            time2.start();
            time2.addEventListener(TimerEvent.TIMER_COMPLETE,onEnterFarme2);
         };
         onEnterFarme2 = function(param1:Event):void
         {
            time2.stop();
            time2.removeEventListener(TimerEvent.TIMER_COMPLETE,onEnterFarme2);
            time2 = null;
            LoadingBar(3);
            time3 = new Timer(_s,1);
            time3.start();
            time3.addEventListener(TimerEvent.TIMER_COMPLETE,onEnterFarme3);
         };
         onEnterFarme3 = function(param1:Event):void
         {
            time3.stop();
            time3.removeEventListener(TimerEvent.TIMER_COMPLETE,onEnterFarme3);
            time3 = null;
            LoadingBar(4);
            time4 = new Timer(_s,1);
            time4.start();
            time4.addEventListener(TimerEvent.TIMER_COMPLETE,onEnterFarme4);
         };
         onEnterFarme4 = function(param1:Event):void
         {
            var _loc2_:Object = null;
            time4.stop();
            time4.removeEventListener(TimerEvent.TIMER_COMPLETE,onEnterFarme4);
            time4 = null;
            if(type == 335)
            {
               GameInstance.app.mouseEnabled = GameInstance.app.mouseChildren = true;
               KeyboardManager.enable = true;
               _loc2_ = {"335":128};
               PipeManager.sendMsg(PipeConstants.SEND_53095,[_loc2_[type]]);
            }
            else
            {
               LoadingBar(5);
               time5 = new Timer(_s,1);
               time5.start();
               time5.addEventListener(TimerEvent.TIMER_COMPLETE,onEnterFarme5);
            }
         };
         onEnterFarme5 = function(param1:Event):void
         {
            time5.stop();
            time5.removeEventListener(TimerEvent.TIMER_COMPLETE,onEnterFarme5);
            time5 = null;
            GameInstance.app.mouseEnabled = GameInstance.app.mouseChildren = true;
            KeyboardManager.enable = true;
            var _loc2_:Object = {
               "34":31,
               "77":76,
               "210":76
            };
            PipeManager.sendMsg(PipeConstants.SEND_53095,[_loc2_[type]]);
         };
         var LoadingBar:Function = function(param1:int):void
         {
            SmallLoadingBar.close();
            var _loc2_:String = "";
            var _loc3_:int = 0;
            if(type == 34)
            {
               if(param1 == 1)
               {
                  _loc2_ = LanResManager.getLanCommonTextWords("正在舀水．．．");
                  _loc3_ = _s;
               }
               else if(param1 == 2)
               {
                  _loc2_ = LanResManager.getLanCommonTextWords("正在洗发唱歌．．．");
                  _loc3_ = _s;
               }
               else if(param1 == 3)
               {
                  _loc2_ = LanResManager.getLanCommonTextWords("正在洗脚．．．");
                  _loc3_ = _s;
               }
               else if(param1 == 4)
               {
                  _loc2_ = LanResManager.getLanCommonTextWords("正在傻看姑娘．．．");
                  _loc3_ = _s;
               }
               else if(param1 == 5)
               {
                  _loc2_ = LanResManager.getLanCommonTextWords("正在沐浴．．．");
                  _loc3_ = _s;
               }
            }
            else if(type == 77 || type == 210)
            {
               if(param1 == 1)
               {
                  _loc2_ = LanResManager.getLanCommonTextWords("开始洗澡");
                  _loc3_ = _s;
               }
               else if(param1 == 2)
               {
                  _loc2_ = LanResManager.getLanCommonTextWords("在洗头发唱歌");
                  _loc3_ = _s;
               }
               else if(param1 == 3)
               {
                  _loc2_ = LanResManager.getLanCommonTextWords("在擦全身");
                  _loc3_ = _s;
               }
               else if(param1 == 4)
               {
                  _loc2_ = LanResManager.getLanCommonTextWords("在偷窥一位姑娘");
                  _loc3_ = _s;
               }
               else if(param1 == 5)
               {
                  _loc2_ = LanResManager.getLanCommonTextWords("边洗澡边耍水");
                  _loc3_ = _s;
               }
            }
            else if(type == 335)
            {
               if(param1 == 1)
               {
                  _loc2_ = "Vạn sự nhân gian thoáng mộng thôi";
                  _loc3_ = _s;
               }
               else if(param1 == 2)
               {
                  _loc2_ = "Một mình vọng nguyệt nghe thu vắng";
                  _loc3_ = _s;
               }
               else if(param1 == 3)
               {
                  _loc2_ = "Thanh phong khe khẽ cuốn mây trôi";
                  _loc3_ = _s;
               }
               else if(param1 == 4)
               {
                  _loc2_ = "Trăng sáng treo cao giữa cõi trời";
                  _loc3_ = _s;
               }
            }
            SynthesizeMsg.SynthesizeSmallLoadingBarMsg = _loc2_;
            SmallLoadingBar.showLoading(SynthesizeMsg.SynthesizeSmallLoadingBarMsg,_loc3_);
         };
         ZLog.add("53096：越南 特殊活动返回");
         _buf = $data;
         type = $data.readInt();
         if(type == 1)
         {
            gid = _buf.readInt();
            PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[gid,1]);
         }
         else if(type == 2)
         {
            day = _buf.readInt();
            PipeManager.sendMsg(PipeConstants.YN_SHOW_CHUNJIEHUODONGPANEL,5);
         }
         else if(type == 34)
         {
            GameInstance.mainChar.stopMove();
            TopTipManager.getInstance().removeTip(MainCharSeachPathManager.AUTO_FIND_PATH_TEXT);
            KeyboardManager.enable = false;
            GameInstance.app.mouseEnabled = GameInstance.app.mouseChildren = false;
            LoadingBar(1);
            this.time1 = new Timer(this._s,1);
            this.time1.start();
            this.time1.addEventListener(TimerEvent.TIMER_COMPLETE,onEnterFarme);
         }
         else if(type == 41)
         {
            num1 = $data.readInt();
            num = $data.readByte();
            ar = [];
            o = {};
            i = 0;
            while(i < num)
            {
               obj = new Object();
               obj.id = $data.readInt();
               obj.num = $data.readInt();
               ar.push(obj);
               i++;
            }
            o.ar = ar;
            o.num = num1;
            PipeManager.sendMsg(PipeConstants.YN_REQUEST_SHOUCICHONGZHI_PANEL,o);
         }
         else if(type == 125)
         {
            num1 = $data.readInt();
            num = $data.readByte();
            ar = [];
            o = {};
            i = 0;
            while(i < num)
            {
               obj = new Object();
               obj.id = $data.readInt();
               obj.num = $data.readInt();
               ar.push(obj);
               i++;
            }
            o.ar = ar;
            o.num = num1;
            PipeManager.sendMsg(PipeConstants.YN_REQUEST_SHOUCICHONGZHI2_PANEL,o);
         }
         else if(type == 42)
         {
            score = $data.readInt();
            PipeManager.sendMsg(PipeConstants.YN_REQUEST_YUENAN2015ZHONGQIU,score);
         }
         else if(type == 77 || type == 210)
         {
            b = $data.readBoolean();
            if(b)
            {
               GameInstance.mainChar.stopMove();
               TopTipManager.getInstance().removeTip(MainCharSeachPathManager.AUTO_FIND_PATH_TEXT);
               KeyboardManager.enable = false;
               GameInstance.app.mouseEnabled = GameInstance.app.mouseChildren = false;
               LoadingBar(1);
               this.time1 = new Timer(this._s,1);
               this.time1.start();
               this.time1.addEventListener(TimerEvent.TIMER_COMPLETE,onEnterFarme);
            }
            else
            {
               str = LanResManager.getLanCommonTextWords("已经沐浴或不在活动时间内");
               NoticeManager.notify(NoticeManager.FOOT,str);
            }
         }
         else if(type == 78)
         {
            name = $data.readUTF();
            GameInstance.uiInstance.yn2016MengZhuZhuFuPanel.showPanel(name);
         }
         else if(type == 335)
         {
            b = $data.readBoolean();
            if(b)
            {
               GameInstance.mainChar.stopMove();
               TopTipManager.getInstance().removeTip(MainCharSeachPathManager.AUTO_FIND_PATH_TEXT);
               KeyboardManager.enable = false;
               GameInstance.app.mouseEnabled = GameInstance.app.mouseChildren = false;
               LoadingBar(1);
               this.time1 = new Timer(this._s,1);
               this.time1.start();
               this.time1.addEventListener(TimerEvent.TIMER_COMPLETE,onEnterFarme);
            }
            else
            {
               str = LanResManager.getLanCommonTextWords("已经沐浴或不在活动时间内");
               NoticeManager.notify(NoticeManager.FOOT,str);
            }
         }
      }
      
      public function received_80102(param1:ByteArray) : void
      {
         ZLog.add("80102：越南 返回登陆信息");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:String = param1.readUTF();
         var _loc5_:AttributeInfo = GameInstance.mainCharData.attributeInfo;
         _loc5_.ynName = _loc4_;
         _loc5_.ynPingtai = _loc2_;
         _loc5_.ynServerID = _loc3_;
      }
      
      public function received_53098(param1:ByteArray) : void
      {
         ZLog.add("53098：越南 返回贺岁树信息");
         var _loc2_:int = param1.readByte();
         this.mediator.setYNhesuishu(_loc2_);
      }
      
      public function received_80922(param1:ByteArray) : void
      {
         ZLog.add("80922：越南 返回放生鲤鱼面板");
         this.mediator.setYNfangshengliyu();
      }
      
      public function received_83218(param1:ByteArray) : void
      {
         var s:int = 0;
         var $data:ByteArray = param1;
         s = $data.readByte();
         setTimeout(function():void
         {
            if(s == 1)
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("采集成功"));
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("采集成功"));
            }
            else
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("采集失败"));
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("采集失败"));
            }
            SmallLoadingBar.close();
         },10000);
      }
   }
}

