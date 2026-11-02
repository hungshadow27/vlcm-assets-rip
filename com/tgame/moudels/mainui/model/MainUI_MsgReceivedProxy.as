package com.tgame.moudels.mainui.model
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.map.MapTransManager;
   import com.tgame.common.res.task.TaskRes;
   import com.tgame.common.res.task.TaskResManager;
   import com.tgame.common.staticdata.HeadResChange;
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.TaskTracker;
   import com.tgame.manager.TopTipManager;
   import com.tgame.moudels.mainui.view.MainUI_BossRefurBishMediator;
   import com.tgame.moudels.mainui.view.MainUI_ConcernMsgMediator;
   import com.tgame.moudels.mainui.view.MainUI_LeftTopTipsMediator;
   import com.tgame.moudels.mainui.view.MainUI_MainUIMediator;
   import com.tgame.moudels.mainui.view.MainUI_MiniMapMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class MainUI_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "MainUI_MsgReceivedProxy";
      
      private var _mainUI_BossRefurbishMediator:MainUI_BossRefurBishMediator;
      
      private var _mainUI_MiniMapMediator:MainUI_MiniMapMediator;
      
      private var _mainUI_concernMsgMediator:MainUI_ConcernMsgMediator;
      
      private var _mainUI_MiniMediator:MainUI_MainUIMediator;
      
      private var _leftTopTipsMediator:MainUI_LeftTopTipsMediator;
      
      private var _msgSenderProxy:MainUI_MsgSendProxy;
      
      public function MainUI_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      override public function onRegister() : void
      {
         NoticeManager.myMsgFun = this.myMsg;
         NoticeManager.addedToConcernMsgPanelFun = this.concernMsg;
         NetWorkManager.registerMsgs([10132,10134,22222,40012,40032,65531,22224,10050,40024,40026,40034,40036,53852,53856,53858,53864,53868,53870,53872,54008,51962,51966,40030,20504,20506,20508,10136,10720,20510,20512,20514,61042,61044,71836,11220,80324,81838,82212,79728,79490,79500,79502,81384,81388,81390],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([10132,10134,22222,40012,40032,65531,22224,10050,40024,40026,40034,40036,53852,53856,53858,53864,53868,53870,53872,54008,51962,51966,40030,20504,20506,20508,10136,10720,20510,20512,20514,61042,61044,71836,11220,80324,81838,82212,79728,79490,79500,79502,81384,81388,81390],NAME);
      }
      
      private function get mainUI_BossRefurbishMediator() : MainUI_BossRefurBishMediator
      {
         if(this._mainUI_BossRefurbishMediator == null)
         {
            this._mainUI_BossRefurbishMediator = facade.retrieveMediator(MainUI_BossRefurBishMediator.NAME) as MainUI_BossRefurBishMediator;
         }
         return this._mainUI_BossRefurbishMediator;
      }
      
      private function get mainUI_MiniMapMediator() : MainUI_MiniMapMediator
      {
         if(this._mainUI_MiniMapMediator == null)
         {
            this._mainUI_MiniMapMediator = facade.retrieveMediator(MainUI_MiniMapMediator.NAME) as MainUI_MiniMapMediator;
         }
         return this._mainUI_MiniMapMediator;
      }
      
      private function get mainUI_concernMsgMediator() : MainUI_ConcernMsgMediator
      {
         if(this._mainUI_concernMsgMediator == null)
         {
            this._mainUI_concernMsgMediator = facade.retrieveMediator(MainUI_ConcernMsgMediator.NAME) as MainUI_ConcernMsgMediator;
         }
         return this._mainUI_concernMsgMediator;
      }
      
      private function get mainUI_MiniMediator() : MainUI_MainUIMediator
      {
         if(this._mainUI_MiniMediator == null)
         {
            this._mainUI_MiniMediator = facade.retrieveMediator(MainUI_MainUIMediator.NAME) as MainUI_MainUIMediator;
         }
         return this._mainUI_MiniMediator;
      }
      
      private function get leftTopTipsMediator() : MainUI_LeftTopTipsMediator
      {
         if(this._leftTopTipsMediator == null)
         {
            this._leftTopTipsMediator = facade.retrieveMediator(MainUI_LeftTopTipsMediator.NAME) as MainUI_LeftTopTipsMediator;
         }
         return this._leftTopTipsMediator;
      }
      
      private function get msgSenderProxy() : MainUI_MsgSendProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(MainUI_MsgSendProxy.NAME) as MainUI_MsgSendProxy;
         }
         return this._msgSenderProxy;
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
      
      public function received_10132(param1:ByteArray) : void
      {
         ZLog.add("10132：世界地图传送查询返回");
         var _loc2_:Object = {};
         _loc2_.id = param1.readInt();
         _loc2_.name = param1.readUTF();
         _loc2_.restrict = param1.readShort();
         _loc2_.monst = param1.readUTF();
         _loc2_.level = param1.readUTF();
         _loc2_.boss = param1.readUTF();
         _loc2_.time = param1.readUTF();
         _loc2_.item = param1.readUTF();
         _loc2_.expand = param1.readInt();
         this.mainUI_MiniMapMediator.showMapPortalPanel(_loc2_);
      }
      
      public function received_10134(param1:ByteArray) : void
      {
         ZLog.add("10134：世界地图传送");
         PipeManager.sendMsg(PipeConstants.START_WORLD_MAP_GOTO);
         PipeManager.sendMsg(PipeConstants.CHANGED_LOCKEDCHAR_BASE_ATTR,null);
      }
      
      public function received_22222(param1:ByteArray) : void
      {
         ZLog.add("22222：接收服务器提示与错误统一消息");
         var _loc2_:String = param1.readUTF();
         var _loc3_:String = param1.readUTF();
         var _loc4_:String = "0";
         var _loc5_:Array = _loc2_.split(",");
         if(_loc5_.indexOf("1") != -1)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_CHAT,_loc3_,false);
         }
         if(_loc5_.indexOf("2") != -1 || _loc5_.indexOf("5") != -1)
         {
            NoticeManager.notify(NoticeManager.FOOT,_loc3_,false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc3_,false);
         }
         if(_loc5_.indexOf("3") != -1)
         {
            NoticeManager.notify(NoticeManager.ALERT,_loc3_,false);
         }
         if(_loc5_.indexOf("4") != -1)
         {
            _loc4_ = param1.readUTF();
            NoticeManager.notify(NoticeManager.SYSTEM_ROLL,_loc3_,false,_loc4_);
         }
         if(_loc5_.indexOf("6") != -1)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_SWITCH,_loc3_,false);
         }
         if(_loc5_.indexOf("7") != -1)
         {
            NoticeManager.notify(NoticeManager.CENTER,_loc3_,false);
         }
         ZLog.add("22222:" + _loc3_);
      }
      
      public function received_22224(param1:ByteArray) : void
      {
         var time:String;
         var msgTypes:String;
         var msgTypeArr:Array;
         var shuliangFun:Function;
         var shuziArr:Array = null;
         var guaiwuId:int = 0;
         var compl:Function = null;
         var newBytes:ByteArray = null;
         var load:Loader = null;
         var tishiShuzi:String = null;
         var msg:String = null;
         var spr:Sprite = null;
         var shuliangInt:int = 0;
         var bitMap:Bitmap = null;
         var dis:DisplayObject = null;
         var i:int = 0;
         var $data:ByteArray = param1;
         compl = function(param1:Event):void
         {
            var _loc2_:Bitmap = param1.target.content as Bitmap;
            NoticeManager.notify(NoticeManager.CENTER_BITMAP,"",false,"",_loc2_);
         };
         ZLog.add("22224：接收服务器统一提示消息22224");
         time = "0";
         msgTypes = $data.readUTF();
         if(msgTypes == "9")
         {
            newBytes = new ByteArray();
            $data.readBytes(newBytes);
            load = new Loader();
            load.loadBytes(newBytes);
            load.contentLoaderInfo.addEventListener(Event.COMPLETE,compl);
         }
         else if(msgTypes == "10")
         {
            tishiShuzi = $data.readUTF();
            shuziArr = tishiShuzi.split("#");
         }
         else if(msgTypes == "11")
         {
            guaiwuId = $data.readInt();
            msg = NetWorkManager.readGILMsg($data);
            if(msg == "")
            {
               return;
            }
         }
         else
         {
            msg = NetWorkManager.readGILMsg($data);
            if(msg == "")
            {
               return;
            }
         }
         msgTypeArr = msgTypes.split(",");
         if(msgTypeArr.indexOf("1") != -1)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_CHAT,msg,false);
         }
         if(msgTypeArr.indexOf("2") != -1 || msgTypeArr.indexOf("5") != -1)
         {
            NoticeManager.notify(NoticeManager.FOOT,msg,false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,msg,false);
         }
         if(msgTypeArr.indexOf("3") != -1)
         {
            NoticeManager.notify(NoticeManager.ALERT,msg,false);
         }
         if(msgTypeArr.indexOf("4") != -1)
         {
            time = $data.readUTF();
            NoticeManager.notify(NoticeManager.SYSTEM_ROLL,msg,false,time);
         }
         if(msgTypeArr.indexOf("6") != -1)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_SWITCH,msg,false);
         }
         if(msgTypeArr.indexOf("7") != -1)
         {
            NoticeManager.notify(NoticeManager.CENTER,msg,false);
         }
         if(msgTypeArr.indexOf("8") != -1)
         {
            NoticeManager.notify(NoticeManager.CENTER_UP,msg,false);
         }
         if(msgTypeArr.indexOf("10") != -1)
         {
            shuliangFun = function(param1:DisplayObject, param2:int):void
            {
               var _loc3_:BitmapData = null;
               spr.addChild(param1);
               param1.x = param2 * 100;
               if(shuliangInt == shuziArr.length - 1)
               {
                  _loc3_ = new BitmapData(spr.width,spr.height,true,16777215);
                  _loc3_.draw(spr);
                  bitMap.bitmapData = _loc3_;
                  NoticeManager.notify(NoticeManager.CENTER_BITMAP,"",false,"",bitMap,1);
               }
               ++shuliangInt;
            };
            spr = new Sprite();
            bitMap = new Bitmap();
            i = 0;
            while(i < shuziArr.length)
            {
               dis = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/pingmuTishi/" + shuziArr[i] + ".swf",shuliangFun,i);
               i++;
            }
         }
         if(msgTypeArr.indexOf("11") != -1)
         {
            NoticeManager.guaiwuShuohua(guaiwuId,msg);
         }
      }
      
      public function received_65531(param1:ByteArray) : void
      {
         var _loc2_:String = param1.readUTF();
         ZLog.add("65531：收到聊天服务器消息：" + _loc2_);
      }
      
      public function received_40024(param1:ByteArray) : void
      {
         var allPage:int;
         var myRank:int;
         var n:int;
         var i:int;
         var arr:Array = null;
         var timer:Timer = null;
         var timerComplete:Function = null;
         var o:Object = null;
         var $data:ByteArray = param1;
         timerComplete = function(param1:TimerEvent):void
         {
            mainUI_BossRefurbishMediator.bossRefurBishTianXiaNo1(arr);
            timer.removeEventListener(TimerEvent.TIMER_COMPLETE,timerComplete);
            timer = null;
         };
         ZLog.add("40024：Boss刷新之论剑天下第一");
         allPage = $data.readByte();
         myRank = $data.readByte();
         n = $data.readByte();
         arr = [];
         i = 0;
         while(i < n)
         {
            o = {};
            o.id = $data.readInt();
            o.name = $data.readUTF();
            o.qufu = $data.readUTF();
            o.dengji = $data.readShort();
            o.shenglv = $data.readUTF();
            o.shengwang = $data.readShort();
            o.zhanchang = $data.readByte();
            arr[arr.length] = o;
            i++;
         }
         timer = new Timer(150,1);
         timer.start();
         timer.addEventListener(TimerEvent.TIMER_COMPLETE,timerComplete);
      }
      
      public function received_40026(param1:ByteArray) : void
      {
         ZLog.add("40026：Boss刷新之论剑天下第一之我的上榜状态");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         this.mainUI_BossRefurbishMediator.bossRefurBishMyStatus(_loc2_,_loc3_);
      }
      
      public function received_40034(param1:ByteArray) : void
      {
         var n:int;
         var i:int;
         var allPage:int = 0;
         var myRank:int = 0;
         var r:Array = null;
         var timer:Timer = null;
         var timerComplete:Function = null;
         var $data:ByteArray = param1;
         timerComplete = function(param1:TimerEvent):void
         {
            mainUI_BossRefurbishMediator.bossRefurBish3v3(allPage,myRank,r);
            timer.removeEventListener(TimerEvent.TIMER_COMPLETE,timerComplete);
            timer = null;
         };
         ZLog.add("40034：3v3");
         allPage = $data.readByte();
         myRank = $data.readByte();
         n = $data.readByte();
         r = [];
         i = 0;
         while(i < n)
         {
            r.push([$data.readInt(),$data.readUTF(),$data.readInt(),undefined,$data.readShort()]);
            i++;
         }
         timer = new Timer(150,1);
         timer.start();
         timer.addEventListener(TimerEvent.TIMER_COMPLETE,timerComplete);
      }
      
      public function received_40036(param1:ByteArray) : void
      {
         ZLog.add("40036：Boss刷新之论剑天下第一之我的上榜状态");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         this.mainUI_BossRefurbishMediator.bossRefurBishMyStatus3v3(_loc2_,_loc3_);
      }
      
      public function received_40012(param1:ByteArray) : void
      {
         var n:int;
         var r1:Array;
         var r2:Array;
         var tempGoodsIDArr:Array;
         var i:int;
         var timer:Timer = null;
         var timerComplete:Function = null;
         var o:Object = null;
         var id:int = 0;
         var $data:ByteArray = param1;
         timerComplete = function(param1:TimerEvent):void
         {
            timer.removeEventListener(TimerEvent.TIMER_COMPLETE,timerComplete);
            timer = null;
         };
         ZLog.add("40012：收到征服目标");
         n = $data.readByte();
         r1 = [];
         r2 = [];
         tempGoodsIDArr = [7002,7003,7004];
         i = 0;
         while(i < n)
         {
            o = {};
            o.name = $data.readUTF();
            o.synopsis = $data.readUTF();
            o.ifachieve = $data.readByte() == 0 ? false : true;
            o.lv = $data.readShort();
            o.ifachieve = GameInstance.mainCharData.attributeInfo.lv >= o.lv ? true : false;
            r1.push(o);
            i++;
         }
         n = $data.readByte();
         i = 0;
         while(i < n)
         {
            o = {};
            o.content = $data.readUTF();
            o.ifachieve = $data.readByte() == 0 ? false : true;
            id = $data.readInt();
            o.bigImg = new Goods(id);
            if(!o.bigImg.res)
            {
               o.bigImg = new Goods(tempGoodsIDArr[i]);
            }
            r2.push(o);
            i++;
         }
         timer = new Timer(150,1);
         timer.start();
         timer.addEventListener(TimerEvent.TIMER_COMPLETE,timerComplete);
      }
      
      public function received_40032(param1:ByteArray) : void
      {
         var n:int;
         var tasksArr:Array;
         var i:int;
         var fbArr:Array;
         var bossRefurbishTime:String;
         var exp:Number;
         var kills:int;
         var items:int;
         var tasks:int;
         var zhenQi:int;
         var killBoss:int;
         var getShengWang:int;
         var zhenFas:int;
         var nb:int;
         var r:Array = null;
         var timer:Timer = null;
         var timerComplete:Function = null;
         var fun:Function = null;
         var taskID:int = 0;
         var typeStr:String = null;
         var n1:int = 0;
         var n2:int = 0;
         var str:String = null;
         var fbStr:String = null;
         var nid:int = 0;
         var $data:ByteArray = param1;
         timerComplete = function(param1:TimerEvent):void
         {
            mainUI_concernMsgMediator.waitTodo(r);
            msgSenderProxy.waitTodoLoadBuffer.close();
            msgSenderProxy.waitTodoLoadBuffer = null;
            timer.removeEventListener(TimerEvent.TIMER_COMPLETE,timerComplete);
            timer = null;
         };
         fun = function(param1:int):void
         {
            var _loc2_:TaskRes = null;
            if(GameInstance.mainCharData.taskInfo.hasTask(param1))
            {
               TaskTracker.doTaskNextBehavior(param1);
            }
            else if(GameInstance.mainCharData.taskInfo.isEndTask(param1))
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(MainUI_MsgReceivedProxy,"该任务已完成或不存在"));
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(MainUI_MsgReceivedProxy,"该任务已完成或不存在"));
            }
            else
            {
               _loc2_ = TaskResManager.getTaskRes(param1);
               MainCharSeachPathManager.mainCharWalk(_loc2_.acceptNpc);
            }
         };
         ZLog.add("40032：收到待办事宜");
         n = $data.readByte();
         r = [];
         tasksArr = [];
         i = 0;
         while(i < n)
         {
            taskID = $data.readInt();
            typeStr = $data.readUTF();
            n1 = $data.readShort();
            n2 = $data.readShort();
            str = typeStr;
            tasksArr.push({
               "str":str,
               "n1":n1,
               "n2":n2,
               "fun":fun,
               "tid":taskID
            });
            i++;
         }
         n = $data.readByte();
         fbArr = [];
         i = 0;
         while(i < n)
         {
            fbStr = $data.readUTF();
            n1 = $data.readInt();
            n2 = $data.readInt();
            nid = $data.readInt();
            fbArr.push({
               "str":fbStr,
               "tid":nid,
               "n1":n1,
               "n2":n2
            });
            i++;
         }
         bossRefurbishTime = $data.readUTF();
         exp = $data.readDouble();
         kills = $data.readInt();
         items = $data.readInt();
         tasks = $data.readInt();
         zhenQi = $data.readInt();
         killBoss = $data.readInt();
         getShengWang = $data.readInt();
         zhenFas = $data.readInt();
         nb = $data.readByte();
         r.push(tasksArr,fbArr,bossRefurbishTime,exp,kills,zhenFas,zhenQi,killBoss,getShengWang,tasks,nb);
         timer = new Timer(150,1);
         timer.start();
         timer.addEventListener(TimerEvent.TIMER_COMPLETE,timerComplete);
      }
      
      public function received_40030(param1:ByteArray) : void
      {
         var _loc5_:Array = null;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         ZLog.add("40030 ie关闭提示");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = new Array();
            _loc6_ = param1.readUTF();
            _loc7_ = param1.readInt();
            _loc5_.push(_loc6_);
            _loc5_.push(_loc7_);
            _loc3_.push(_loc5_);
            _loc4_++;
         }
         this.mainUI_concernMsgMediator.setIeGuanbiTishiFun(_loc3_);
      }
      
      public function received_10050(param1:ByteArray) : void
      {
         ZLog.add("10050：场景中改变头像");
         var _loc2_:int = param1.readByte();
         var _loc3_:Player = GameInstance.mainCharData as Player;
         var _loc4_:AttributeInfo = _loc3_.attributeInfo;
         _loc4_.headImg = HeadResChange.headResChangeToString(_loc2_);
         this.mainUI_MiniMediator.setCharHead(_loc4_.headImg);
      }
      
      private function concernMsg(param1:String, param2:String) : void
      {
         var _loc3_:Array = [];
         var _loc4_:Date = new Date(Number(param2));
         this.mainUI_concernMsgMediator.getMsg(_loc4_,param1);
      }
      
      private function myMsg(param1:String) : void
      {
         this.mainUI_concernMsgMediator.myMsg(param1);
      }
      
      public function received_53852(param1:ByteArray) : void
      {
         var _loc6_:Object = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         ZLog.add("53852：请求32强列表返回");
         var _loc2_:Array = [LanResManager.getLanCommonTextWords("天闲组"),LanResManager.getLanCommonTextWords("天勇组"),LanResManager.getLanCommonTextWords("天雄组"),LanResManager.getLanCommonTextWords("天猛组"),LanResManager.getLanCommonTextWords("天威组"),LanResManager.getLanCommonTextWords("天英组"),LanResManager.getLanCommonTextWords("天贵组"),LanResManager.getLanCommonTextWords("天富组"),LanResManager.getLanCommonTextWords("天满组"),LanResManager.getLanCommonTextWords("天孤组"),LanResManager.getLanCommonTextWords("天伤组"),LanResManager.getLanCommonTextWords("天立组"),LanResManager.getLanCommonTextWords("天捷组"),LanResManager.getLanCommonTextWords("天暗组"),LanResManager.getLanCommonTextWords("天佑组"),LanResManager.getLanCommonTextWords("天空组"),LanResManager.getLanCommonTextWords("天速组"),LanResManager.getLanCommonTextWords("天异组"),LanResManager.getLanCommonTextWords("天杀组"),LanResManager.getLanCommonTextWords("天微组"),LanResManager.getLanCommonTextWords("天究组"),LanResManager.getLanCommonTextWords("天退组"),LanResManager.getLanCommonTextWords("天寿组")
         ,LanResManager.getLanCommonTextWords("天剑组"),LanResManager.getLanCommonTextWords("天平组"),LanResManager.getLanCommonTextWords("天罪组"),LanResManager.getLanCommonTextWords("天巧组"),LanResManager.getLanCommonTextWords("天牢组"),LanResManager.getLanCommonTextWords("天慧组"),LanResManager.getLanCommonTextWords("天暴组"),LanResManager.getLanCommonTextWords("天魁组"),LanResManager.getLanCommonTextWords("天罡组")];
         var _loc3_:Object = {};
         _loc3_.count = param1.readByte();
         if(_loc3_.count == 0)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("暂无数据"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("暂无数据"),false);
            return;
         }
         _loc3_.shangbang = param1.readByte() < 1 ? 0 : 1;
         _loc3_.lingjiang = param1.readByte();
         var _loc4_:int = param1.readByte();
         _loc3_.r = [];
         if(_loc4_ == 0)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("暂无数据"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("暂无数据"),false);
            return;
         }
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = {};
            _loc6_.qufu = param1.readUTF();
            _loc6_.id = param1.readInt();
            _loc7_ = param1.readByte();
            _loc6_.xiaozu = _loc2_[_loc7_ - 1];
            if(_loc6_.xiaozu == undefined)
            {
               _loc6_.xiaozu = LanResManager.getLanCommonTextWords("无此组");
            }
            _loc6_.name = param1.readUTF();
            _loc8_ = param1.readInt();
            _loc6_.zhanchang = _loc8_ == 0 ? LanResManager.getLanCommonTextWords("无地图") : MapTransManager.getMapRes(_loc8_).name;
            _loc6_.shijian = param1.readUTF();
            _loc6_.zhuangtai = param1.readByte();
            _loc6_.dengji = param1.readShort();
            _loc6_.zhandouli = param1.readDouble();
            _loc6_.zhuweicishu = param1.readShort();
            _loc6_.isLiang = param1.readByte();
            _loc3_.r.push(_loc6_);
            _loc5_++;
         }
         this.mainUI_BossRefurbishMediator.setBiWuDaHuiList32(_loc3_);
      }
      
      public function received_53856(param1:ByteArray) : void
      {
         ZLog.add("53856：助威返回");
         var _loc2_:int = param1.readByte();
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readInt();
         this.mainUI_BossRefurbishMediator.setBiWuDaHuiZhuWeiComplete(_loc2_,_loc3_,_loc4_);
      }
      
      public function received_53858(param1:ByteArray) : void
      {
         ZLog.add("53858：领奖返回");
         var _loc2_:int = param1.readByte();
         this.mainUI_BossRefurbishMediator.setBiWuDaHuiGiftComplete(_loc2_);
      }
      
      public function received_53864(param1:ByteArray) : void
      {
         ZLog.add("53864：比赛日期返回");
         var _loc2_:String = param1.readUTF();
         this.mainUI_BossRefurbishMediator.setData(_loc2_);
      }
      
      public function received_53868(param1:ByteArray) : void
      {
         ZLog.add("53868：显示/不显示跨服包裹按钮");
         var _loc2_:int = param1.readByte();
         this.mainUI_BossRefurbishMediator.setShowButton(_loc2_);
      }
      
      public function received_53870(param1:ByteArray) : void
      {
         ZLog.add("53870：比赛结束");
         var _loc2_:String = param1.readUTF();
         this.mainUI_BossRefurbishMediator.gameEnd(_loc2_);
      }
      
      public function received_53872(param1:ByteArray) : void
      {
         ZLog.add("53872：进入/离开比赛地图");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == -1)
         {
            this.mainUI_BossRefurbishMediator.setShowButton(0);
            TopTipManager.getInstance().removeTip("guaji");
            ReloginManager.isInKuafu_To_biWuDaHui = 0;
         }
         else if(_loc2_ == 0)
         {
            this.mainUI_BossRefurbishMediator.setShowButton(2);
            ReloginManager.isInKuafu_To_biWuDaHui = 2;
         }
         else if(_loc2_ == 1)
         {
            this.mainUI_BossRefurbishMediator.setShowButton(1);
            ReloginManager.isInKuafu_To_biWuDaHui = 1;
         }
         else if(_loc2_ == 2)
         {
            this.mainUI_BossRefurbishMediator.setShowButton(3);
         }
      }
      
      public function received_54008(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 0)
         {
            this.mainUI_BossRefurbishMediator.setShowBaoShiJianShangInfo(_loc2_);
         }
         else
         {
            _loc3_ = param1.readInt();
            _loc4_ = param1.readInt();
            ZLog.add("54008 宝石鉴赏押注剩余时间（int）（单位：毫秒）:" + _loc3_);
            this.mainUI_BossRefurbishMediator.setShowBaoShiJianShangInfo(_loc2_,_loc3_,_loc4_);
            PipeManager.sendMsg(PipeConstants.SET_BAOSHI_TIME,{"timer":_loc3_});
         }
      }
      
      public function received_51962(param1:ByteArray) : void
      {
         ZLog.add("51962：襄阳战场报名返回");
         var _loc2_:int = param1.readByte();
         var _loc3_:String = "";
         if(_loc2_ == 0)
         {
            ReloginManager.isXiangYangZhanChangBaominging = false;
         }
         else
         {
            ReloginManager.isXiangYangZhanChangBaominging = true;
            _loc3_ = param1.readUTF();
         }
         this.mainUI_BossRefurbishMediator.setZhan(_loc2_ == 1,_loc3_);
      }
      
      public function received_51966(param1:ByteArray) : void
      {
         var _loc11_:String = null;
         var _loc12_:int = 0;
         var _loc13_:String = null;
         var _loc14_:int = 0;
         ZLog.add("51966：报名确认（向除队长的全队广播,此消息如有变化需要刷新）");
         var _loc2_:ByteArray = param1;
         var _loc3_:String = _loc2_.readUTF();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:String = _loc2_.readUTF();
         var _loc6_:String = PartyType.getName(_loc2_.readByte());
         var _loc7_:int = _loc2_.readByte();
         var _loc8_:Array = [];
         var _loc9_:int = _loc2_.readByte();
         var _loc10_:int = 0;
         while(_loc10_ < _loc9_)
         {
            _loc11_ = _loc2_.readUTF();
            _loc12_ = _loc2_.readInt();
            _loc13_ = PartyType.getName(_loc2_.readByte());
            _loc14_ = _loc2_.readByte();
            if(_loc14_ == 0)
            {
               _loc14_ = 4;
            }
            _loc8_.push({
               "name":_loc11_,
               "grade":_loc12_,
               "school":_loc13_,
               "state":_loc14_
            });
            _loc10_++;
         }
         this.mainUI_BossRefurbishMediator.received_querenBaoming(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
      }
      
      public function received_20504(param1:ByteArray) : void
      {
         ZLog.add("20504：防沉迷时间");
         var _loc2_:int = param1.readInt();
         this.mainUI_MiniMediator.setTime(_loc2_);
      }
      
      public function received_20506(param1:ByteArray) : void
      {
         ZLog.add("20506：防沉迷时间提示");
         var _loc2_:int = param1.readByte();
         this.mainUI_MiniMediator.setChenmiTips(_loc2_);
      }
      
      public function received_20508(param1:ByteArray) : void
      {
         ZLog.add("20508：防沉迷功能栏屏蔽");
         var _loc2_:Boolean = Boolean(param1.readByte() == 1);
         this.mainUI_MiniMediator.setBtnEnabled(_loc2_);
      }
      
      public function received_10136(param1:ByteArray) : void
      {
         /*
          * Decompilation error
          * Timeout (1 minute) was reached
          * Instruction count: 6086
          */
         throw new flash.errors.IllegalOperationError("Not decompiled due to timeout");
      }
      
      public function received_10720(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         ZLog.add("10720：左上角信息提示");
         var _loc2_:Boolean = param1.readByte() == 1;
         if(_loc2_)
         {
            _loc3_ = param1.readByte();
            _loc4_ = param1.readInt();
            this.leftTopTipsMediator.setLeftTopTips(_loc2_,_loc3_,_loc4_);
         }
         else
         {
            this.leftTopTipsMediator.setLeftTopTips(_loc2_);
         }
      }
      
      public function received_20510(param1:ByteArray) : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Object = null;
         ZLog.add("20510：夫妻竞技下注面板信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:Boolean = Boolean(_loc2_.readByte() == 1);
         if(_loc3_)
         {
            _loc4_ = [];
            _loc5_ = _loc2_.readInt();
            _loc6_ = _loc2_.readByte();
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc8_ = {};
               _loc8_.id = _loc2_.readInt();
               _loc8_.xzNum = _loc2_.readInt();
               _loc4_.push(_loc8_);
               _loc7_++;
            }
            this.mainUI_MiniMediator.setFuqiJingjiTouzhuPanelInitialize(_loc5_,_loc4_);
            this.mainUI_MiniMediator.setTeamChatChannel(false);
         }
         else
         {
            this.mainUI_MiniMediator.removeFuqiJingjiTouzhuPanel();
            this.mainUI_MiniMediator.setTeamChatChannel(true);
         }
      }
      
      public function received_20512(param1:ByteArray) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:Object = null;
         ZLog.add("20512：夫妻竞技结果面板信息");
         var _loc2_:ByteArray = param1;
         _loc3_ = Boolean(_loc2_.readByte() == 1);
         if(_loc3_)
         {
            _loc4_ = [];
            _loc5_ = _loc2_.readInt();
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc21_ = {};
               _loc21_.paiming = _loc2_.readByte();
               _loc21_.name = _loc2_.readUTF();
               _loc21_.duiwu = _loc2_.readByte();
               _loc21_.jsNum = _loc2_.readInt();
               _loc21_.shenglv = _loc2_.readInt();
               _loc21_.jbNum = _loc2_.readInt();
               _loc21_.bjbNum = _loc2_.readInt();
               _loc4_.push(_loc21_);
               _loc6_++;
            }
            _loc7_ = _loc2_.readInt();
            _loc8_ = _loc2_.readInt();
            _loc3_ = Boolean(_loc2_.readByte() == 1);
            _loc9_ = _loc2_.readDouble();
            _loc10_ = _loc2_.readDouble();
            _loc11_ = _loc2_.readDouble();
            _loc12_ = _loc2_.readInt();
            _loc13_ = _loc2_.readInt();
            _loc14_ = _loc2_.readInt();
            _loc15_ = _loc2_.readInt();
            _loc16_ = _loc2_.readInt();
            _loc17_ = _loc2_.readInt();
            _loc18_ = _loc2_.readInt();
            _loc19_ = _loc2_.readInt();
            _loc20_ = _loc2_.readInt();
            this.mainUI_MiniMediator.setFuqiJingjiResultPanelInitialize(_loc4_,_loc7_,_loc8_,_loc3_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_,_loc15_,_loc16_,_loc17_,_loc18_,_loc19_,_loc20_);
         }
         else
         {
            this.mainUI_MiniMediator.removeFuqiJingjiResultPanel();
         }
      }
      
      public function received_20514(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         ZLog.add("20514：夫妻竞技比分面板信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:Boolean = Boolean(_loc2_.readByte() == 1);
         if(_loc3_)
         {
            _loc4_ = _loc2_.readInt();
            _loc5_ = _loc2_.readInt();
            this.mainUI_MiniMediator.setFuQiJingJiVSPanelInitialize(_loc4_,_loc5_);
         }
         else
         {
            this.mainUI_MiniMediator.removeFuQiJingJiVSPanel();
         }
      }
      
      public function received_61042(param1:ByteArray) : void
      {
         var _loc9_:Object = null;
         ZLog.add("61042\t\t返回夫妻竞技排行榜信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         var _loc5_:Array = new Array();
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc9_ = new Object();
            _loc9_.index = param1.readInt();
            _loc9_.name1 = param1.readUTF();
            _loc9_.name2 = param1.readUTF();
            _loc9_.id1 = param1.readInt();
            _loc9_.id2 = param1.readInt();
            _loc9_.dengji1 = param1.readInt();
            _loc9_.dengji2 = param1.readInt();
            _loc9_.qufu1 = param1.readInt();
            _loc9_.shenglv1 = param1.readInt();
            _loc9_.qufu2 = param1.readInt();
            _loc9_.shenglv2 = param1.readInt();
            _loc9_.shengwang = param1.readInt();
            _loc5_.push(_loc9_);
            _loc6_++;
         }
         var _loc7_:int = param1.readInt();
         var _loc8_:Boolean = param1.readByte() == 1;
         this.mainUI_BossRefurbishMediator.setFuQiRank(_loc2_,_loc3_,_loc5_,_loc7_,_loc8_);
      }
      
      public function received_61044(param1:ByteArray) : void
      {
         var _loc5_:Object = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         ZLog.add("61044\t\t返回夫妻竞技排行榜信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = new Object();
            _loc5_.id = param1.readInt();
            _loc5_.partyID = param1.readByte();
            _loc6_ = param1.readInt();
            _loc5_.equipArr = [];
            _loc7_ = 0;
            _loc8_ = 0;
            while(_loc8_ < _loc6_)
            {
               _loc9_ = param1.readInt();
               _loc5_.equipArr[_loc5_.equipArr.length] = new Goods(_loc9_);
               if(SpecialGoodsID.getSpecialAvatarType(_loc9_) > 0)
               {
                  _loc7_ = SpecialGoodsID.getSpecialAvatarType(_loc9_);
               }
               _loc8_++;
            }
            _loc5_.usingFashion = _loc7_;
            _loc5_.isOnMount = param1.readByte();
            if(_loc5_.isOnMount)
            {
               _loc5_.mountID = param1.readInt();
            }
            else
            {
               param1.readInt();
            }
            _loc5_.useAvatarType = param1.readInt();
            _loc5_.isFeixing = param1.readByte() == 1;
            _loc3_.push(_loc5_);
            _loc4_++;
         }
         this.mainUI_BossRefurbishMediator.showFuQiAvatar(_loc3_);
      }
      
      public function received_71836(param1:ByteArray) : void
      {
         ZLog.add("71836\t 切换跳跃与地滚");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         var _loc4_:Boolean = Boolean(param1.readByte() == 1);
         this.mainUI_MiniMediator.receivedPlayerJumpDigun(_loc2_,_loc3_,_loc4_);
      }
      
      public function received_11220(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         ZLog.add("11220\t 设置玩家新勋章显示");
         var _loc2_:Boolean = param1.readByte() == 1;
         if(_loc2_)
         {
            _loc3_ = param1.readInt();
         }
         GameInstance.uiInstance.mainUI.setItem(_loc2_,_loc3_);
      }
      
      public function received_80324(param1:ByteArray) : void
      {
         ZLog.add("80324：十二月活动堆雪人数据");
         var _loc2_:Object = new Object();
         var _loc3_:int = param1.readInt();
         var _loc4_:String = param1.readUTF();
         _loc2_.axueQiu = param1.readByte();
         _loc2_.byanJing = param1.readByte();
         _loc2_.cbiZi = param1.readByte();
         _loc2_.dmaoZi = param1.readByte();
         _loc2_.emaoJing = param1.readByte();
         this.mainUI_MiniMediator.setDuiXueRenMapData(_loc2_,_loc3_,_loc4_);
      }
      
      public function received_81838(param1:ByteArray) : void
      {
         var _loc4_:Object = null;
         ZLog.add("81838：八卦快捷菜单选中不弹面板");
         var _loc2_:Object = new Object();
         _loc2_.leng = param1.readInt();
         _loc2_.arr = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.leng)
         {
            _loc4_ = new Object();
            _loc4_.index = param1.readInt();
            _loc4_.isActive = param1.readByte();
            _loc2_.arr.push(_loc4_);
            _loc3_++;
         }
         this.mainUI_MiniMediator.setBaGuaZhenMainUIData(_loc2_);
      }
      
      public function received_82212(param1:ByteArray) : void
      {
         ZLog.add("82212：沙漏倒计时");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:Boolean = Boolean(_loc2_.readByte());
         this.mainUI_MiniMediator.showShiJianShaLouPanel(_loc3_,_loc4_);
      }
      
      public function received_79728(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:Object = null;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:Array = null;
         var _loc17_:Object = null;
         ZLog.add("79728\t返回通关奖励");
         var _loc2_:int = param1.readByte();
         switch(_loc2_)
         {
            case 1:
               _loc3_ = param1.readByte();
               _loc4_ = new Object();
               _loc5_ = [];
               if(_loc3_ == 1)
               {
                  _loc6_ = param1.readInt();
                  _loc7_ = param1.readInt();
                  _loc8_ = param1.readInt();
                  _loc9_ = param1.readInt();
                  _loc10_ = param1.readInt();
                  _loc11_ = param1.readInt();
                  if(_loc11_)
                  {
                     _loc12_ = 0;
                     while(_loc12_ < _loc11_)
                     {
                        _loc13_ = new Object();
                        _loc13_.id = param1.readInt();
                        _loc13_.num = param1.readInt();
                        _loc5_.push(_loc13_);
                        _loc12_++;
                     }
                  }
                  _loc4_.sucess = _loc3_;
                  _loc4_.idBoss = _loc6_;
                  _loc4_.wuhun = _loc7_;
                  _loc4_.zhenqi = _loc8_;
                  _loc4_.tongbi = _loc9_;
                  _loc4_.jingyan = _loc10_;
                  _loc4_.numDaoJu = _loc11_;
                  _loc4_.daoArr = _loc5_;
               }
               else
               {
                  _loc4_.sucess = _loc3_;
               }
               break;
            case 2:
               _loc7_ = param1.readInt();
               _loc14_ = param1.readByte();
               _loc15_ = param1.readInt();
               _loc16_ = [];
               _loc12_ = 0;
               while(_loc12_ < _loc15_)
               {
                  _loc17_ = {};
                  _loc17_.id = param1.readInt();
                  _loc17_.count = param1.readInt();
                  _loc16_.push(_loc17_);
                  _loc12_++;
               }
               this.mainUI_MiniMediator.setYiTianTuLongJiangLi(_loc7_,_loc14_,_loc16_);
         }
      }
      
      public function received_79490(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Array = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:Object = null;
         ZLog.add("79490：倚天屠龙杀人排行榜信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:Boolean = Boolean(_loc2_.readByte());
         if(_loc3_)
         {
            _loc4_ = _loc2_.readInt();
            _loc5_ = _loc2_.readInt();
            _loc6_ = _loc2_.readInt();
            _loc7_ = _loc2_.readInt();
            _loc8_ = _loc2_.readInt();
            _loc9_ = [];
            _loc10_ = 0;
            while(_loc10_ < _loc8_)
            {
               _loc12_ = {};
               _loc12_.rank = _loc2_.readInt();
               _loc12_.name = _loc2_.readUTF();
               _loc12_.count = _loc2_.readInt();
               _loc12_.wuhun = _loc2_.readInt();
               _loc9_.push(_loc12_);
               _loc10_++;
            }
            _loc11_ = _loc2_.readInt();
         }
         if(_loc3_)
         {
            this.mainUI_MiniMediator.showYiTianTuLong(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc9_,_loc11_);
         }
         else
         {
            this.mainUI_MiniMediator.showYiTianTuLong(_loc3_);
         }
      }
      
      public function received_79500(param1:ByteArray) : void
      {
         ZLog.add("79500：倚天屠龙连斩数");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         this.mainUI_MiniMediator.showLianZhan(_loc3_);
      }
      
      public function received_79502(param1:ByteArray) : void
      {
         ZLog.add("79502：倚天屠龙准备时间");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         this.mainUI_MiniMediator.showZhunBei(_loc3_);
      }
      
      public function received_81384(param1:ByteArray) : void
      {
         ZLog.add("81384：魔兽战场奖励面板数据");
         var _loc2_:Object = new Object();
         _loc2_.isInto = param1.readByte();
         _loc2_.numProgress = param1.readInt();
         _loc2_.time = param1.readInt();
         this.mainUI_MiniMediator.setMoShouZhanChangJiangLiData(_loc2_);
      }
      
      public function received_81388(param1:ByteArray) : void
      {
         ZLog.add("81388：魔兽战场复活面板数据");
         this.mainUI_MiniMediator.setMoShouZhanChangFuHuoData();
      }
      
      public function received_81390(param1:ByteArray) : void
      {
         ZLog.add("81390：魔兽战场延时面板数据");
         this.mainUI_MiniMediator.setMoShouZhanChangYanShiData();
      }
   }
}

