package com.tgame.moudels.achievement.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.achieve.AchieveRes;
   import com.tgame.common.res.achieve.AchieveResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.AchieveInfo;
   import com.tgame.common.vo.character.info.data.AchieveData;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.HeadFaceManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.moudels.achievement.view.Achievement_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.engine.SceneCharacter;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Achievement_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Achievement_MsgReceivedProxy";
      
      public var a_progress:int;
      
      private var _achimediator:Achievement_Mediator;
      
      public function Achievement_MsgReceivedProxy(param1:Object = null)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([51002,51004,51008,51010,51012,51014,51006],this.onHandle,NAME);
      }
      
      private function get achimediator() : Achievement_Mediator
      {
         if(!this._achimediator)
         {
            this._achimediator = facade.retrieveMediator(Achievement_Mediator.NAME) as Achievement_Mediator;
         }
         return this._achimediator;
      }
      
      public function onHandle(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
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
      
      public function received_51002(param1:ByteArray) : void
      {
         var _loc6_:AchieveData = null;
         var _loc2_:int = param1.readByte();
         ZLog.add("请求类别（byte）0天道酬勤，1江湖历练，2强者之路,3神兵神骑,4浴血沙场" + _loc2_);
         var _loc3_:int = param1.readShort();
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = new AchieveData();
            _loc6_.id = param1.readInt();
            _loc6_.progress = param1.readDouble();
            _loc4_.push(_loc6_);
            _loc5_++;
         }
         _loc4_.sortOn("id",Array.NUMERIC);
         GameInstance.mainCharData.achieveInfo.setKindAchieves(_loc4_);
         this.achimediator.pageallshow(this.achimediator.page);
         if(this.achimediator.load)
         {
            this.achimediator.load.close();
         }
      }
      
      public function received_51004(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         this.a_progress = param1.readInt();
         ZLog.add("请求称号列表以及累计成就个数" + this.a_progress);
         var _loc2_:int = param1.readShort();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc7_ = param1.readInt();
            GameInstance.mainCharData.achieveInfo.addTitle(_loc7_);
            if(AchieveResManager.getAchieveRes(_loc7_).title != "")
            {
               _loc3_.push({
                  "label":AchieveResManager.getAchieveRes(_loc7_).title,
                  "data":_loc7_
               });
            }
            _loc4_++;
         }
         _loc5_ = param1.readInt();
         this.achimediator.achievePanel.SetInitializeUi(GameInstance.mainCharData.achieveInfo.getCurrentTitle() != null ? GameInstance.mainCharData.achieveInfo.getCurrentTitle() : "",_loc3_,_loc3_.length,this.a_progress);
         this.achimediator.setGetItemCount(this.a_progress,_loc5_,this.a_progress,_loc5_);
      }
      
      public function received_51012(param1:ByteArray) : void
      {
         var _loc6_:Array = null;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:SceneCharacter = GameInstance.scene.getCharByID(_loc2_);
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:Player = _loc4_.data as Player;
         _loc5_.achieveInfo.setCurrentTitle(_loc3_);
         HeadFaceManager.updateCharCustomHtmlText(_loc2_);
         if(_loc4_.isMainChar())
         {
            _loc6_ = [];
            _loc7_ = GameInstance.mainCharData.achieveInfo.getTitles();
            _loc8_ = int(_loc7_.length);
            _loc9_ = 0;
            while(_loc9_ < _loc8_)
            {
               _loc6_.push({
                  "label":AchieveResManager.getAchieveRes(_loc7_[_loc9_]).title,
                  "data":_loc7_[_loc9_]
               });
               _loc9_++;
            }
            this.achimediator.achievePanel.SetInitializeUi(GameInstance.mainCharData.achieveInfo.getCurrentTitle(),_loc6_,_loc6_.length,this.a_progress);
         }
      }
      
      public function received_51008(param1:ByteArray) : void
      {
         var _loc11_:int = 0;
         var _loc12_:String = null;
         var _loc2_:int = param1.readInt();
         if(AchieveResManager.getAchieveRes(_loc2_).title == null || AchieveResManager.getAchieveRes(_loc2_).title == "")
         {
            return;
         }
         GameInstance.mainCharData.achieveInfo.addTitle(_loc2_);
         var _loc3_:Array = [];
         var _loc4_:int = int(GameInstance.mainCharData.achieveInfo.getTitles().length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc11_ = int(GameInstance.mainCharData.achieveInfo.getTitles()[_loc5_]);
            _loc12_ = AchieveResManager.getAchieveRes(_loc11_).title;
            _loc3_.push({
               "label":AchieveResManager.getAchieveRes(_loc11_).title,
               "data":_loc11_
            });
            _loc5_++;
         }
         this.achimediator.achievePanel.SetInitializeUi(GameInstance.mainCharData.achieveInfo.getCurrentTitle() != null ? GameInstance.mainCharData.achieveInfo.getCurrentTitle() : "",_loc3_,_loc3_.length,this.a_progress);
         var _loc6_:AchieveRes = AchieveResManager.getAchieveRes(_loc2_);
         if(_loc6_ == null)
         {
            return;
         }
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"成就达成",[_loc6_.name,_loc6_.point,_loc6_.title,_loc6_.point,_loc6_.point]) + " ",false);
         var _loc7_:AchieveRes = AchieveRes(_loc6_);
         var _loc8_:Object = new Object();
         _loc8_.name = _loc7_.name;
         _loc8_.isAccomplish = true;
         _loc8_.CjMax = _loc7_.achieve_count;
         _loc8_.CjNow = _loc7_.achieve_count;
         _loc8_.cjmb = _loc7_.desc;
         _loc8_.cjds = _loc7_.point;
         _loc8_.jlch = _loc7_.title;
         var _loc9_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(_loc7_.goods_id,true);
         var _loc10_:String = "";
         if(_loc9_.res != null)
         {
            _loc10_ = LanResManager.getLanTextWords(this,"物品奖励",[_loc9_.res.name]);
         }
         if(_loc7_.point > 0)
         {
            _loc10_ += LanResManager.getLanTextWords(this,"物品奖励2",[_loc7_.point,_loc7_.point]);
         }
         _loc8_.tsjl = _loc10_;
         _loc8_.id = _loc2_;
         _loc8_.icoPath = ResPathManager.getBigICOPath(_loc7_.ico);
         GameInstance.uiInstance.uiContainer.addChild(this.achimediator.achievefunc);
         this.achimediator.achievefunc.visible = true;
         this.achimediator.achievefunc.x = (GameInstance.stage.stageWidth - this.achimediator.achievefunc.panelWidth) / 2;
         this.achimediator.achievefunc.y = (GameInstance.stage.stageHeight - 100 - this.achimediator.achievefunc.panelHeight) / 2;
         this.achimediator.achievefunc.SetInitializeContent([_loc8_]);
      }
      
      public function received_51010(param1:ByteArray) : void
      {
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:String = param1.readUTF();
         var _loc5_:AchieveRes = AchieveResManager.getAchieveRes(_loc3_);
         NoticeManager.notify(NoticeManager.SYSTEM_SWITCH,LanResManager.getLanTextWords(this,"恭喜玩家",[_loc2_,_loc5_.name]),false,_loc4_);
      }
      
      public function received_51006(param1:ByteArray) : void
      {
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         ZLog.add("51006：返回玩家查询 ");
         var _loc2_:int = param1.readShort();
         var _loc3_:int = param1.readByte();
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = param1.readInt();
            _loc7_ = param1.readUTF();
            _loc8_ = param1.readShort();
            _loc9_ = param1.readByte();
            _loc4_.push([_loc6_,_loc7_,_loc8_,_loc9_]);
            _loc5_++;
         }
         this.achimediator.received_shuangxiu_query(_loc2_,_loc4_);
      }
      
      public function received_51014(param1:ByteArray) : void
      {
         var _loc10_:AchieveData = null;
         var _loc11_:AchieveRes = null;
         var _loc2_:int = param1.readByte();
         ZLog.add("请求类别（byte）0天道酬勤，1江湖历练，2强者之路,3神兵神骑,4浴血沙场,5跨平台比武大会" + _loc2_);
         var _loc3_:int = param1.readShort();
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc10_ = new AchieveData();
            _loc10_.id = param1.readInt();
            _loc10_.progress = param1.readDouble();
            _loc11_ = AchieveResManager.getAchieveRes(_loc10_.id);
            _loc10_.achieveRes.point = _loc11_.point;
            _loc4_.push(_loc10_);
            _loc5_++;
         }
         var _loc6_:int = param1.readInt();
         var _loc7_:String = param1.readUTF();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readShort();
         _loc4_.sortOn("id",Array.NUMERIC);
         if(this.achimediator.targetAchieveInfo)
         {
            this.achimediator.targetAchieveInfo = null;
         }
         this.achimediator.targetAchieveInfo = new AchieveInfo();
         this.achimediator.targetAchieveInfo.setKindAchieves(_loc4_);
         this.achimediator.pageallshow(this.achimediator.page,this.achimediator.targetAchieveInfo,_loc6_,_loc7_,_loc8_,_loc9_);
      }
   }
}

