package com.tgame.moudels.gift.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.McBaseItem;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.gift.Gift_ApplicationFacade;
   import com.tgame.moudels.gift.model.GIFT_MsgSenderProxy;
   import com.tgame.shell.view.components.XianshiDajiangDuihuanPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Gift_HuodongMediator extends Mediator
   {
      
      public static const NAME:String = "Gift_HuodongMediator";
      
      private var _huodongID:int = 0;
      
      private var _openHuodongList:Array = [];
      
      private var loaderBuff:LoadBuffer;
      
      private var _msgSenderProxy:GIFT_MsgSenderProxy;
      
      private var _gift_GiftMediator:Gift_GiftMediator;
      
      private var isRequstOtherType:Boolean = false;
      
      private var requstTypeId:int = 0;
      
      public function Gift_HuodongMediator(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      protected function get xianshiDajiangDuihuanPanel() : XianshiDajiangDuihuanPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.xianshiDajiangDuihuanPanel);
         }
         return viewComponent as XianshiDajiangDuihuanPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function get msgSenderProxy() : GIFT_MsgSenderProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(GIFT_MsgSenderProxy.NAME) as GIFT_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function get gift_GiftMediator() : Gift_GiftMediator
      {
         if(this._gift_GiftMediator == null)
         {
            this._gift_GiftMediator = facade.retrieveMediator(Gift_GiftMediator.NAME) as Gift_GiftMediator;
         }
         return this._gift_GiftMediator;
      }
      
      public function f5DajiangState() : void
      {
         if(GameInstance.uiInstance._giftPanel != null)
         {
            if(GameState.xinshiDuihuan == 0)
            {
               GameInstance.uiInstance.xianshiDajiangDuihuanPanel.tabBar.setCurrentButtonByLabel(LanResManager.getLanTextWords(this,"日常活动与副本"));
            }
         }
      }
      
      public function received_openHuodongList(param1:String, param2:Array, param3:int) : void
      {
         this._openHuodongList = param2;
         GameInstance.uiInstance.xianshiDajiangDuihuanPanel.addTabBar(param3);
         GameInstance.uiInstance.xianshiDajiangDuihuanPanel.closeAllHuodong();
         GameInstance.uiInstance.xianshiDajiangDuihuanPanel.setDes(param1,param3);
         GameInstance.uiInstance.xianshiDajiangDuihuanPanel.openHuodongs(this._openHuodongList);
         this.xianshiDajiangDuihuanPanel.setBiaoqian(param3);
         this.removeLoaderBuff();
         var _loc4_:int = int(this._openHuodongList.length);
         if(_loc4_ > 0)
         {
            this._huodongID = this._openHuodongList[0][0];
            this.addLoadBuffer();
            this.msgSenderProxy.send_52055(this._huodongID);
            this.xianshiDajiangDuihuanPanel.setBtnXuanzhong(this._huodongID);
         }
      }
      
      public function getParms(param1:int, param2:int, param3:ByteArray) : Array
      {
         var _loc4_:Array = null;
         var _loc6_:String = null;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         var _loc9_:Array = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:String = null;
         var _loc13_:Goods = null;
         var _loc14_:* = undefined;
         var _loc15_:Array = null;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:Goods = null;
         var _loc22_:Boolean = false;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:Array = null;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:Boolean = false;
         var _loc29_:Boolean = false;
         var _loc30_:int = 0;
         var _loc31_:int = 0;
         var _loc32_:int = 0;
         var _loc33_:int = 0;
         var _loc34_:int = 0;
         var _loc35_:int = 0;
         var _loc36_:Array = null;
         var _loc37_:int = 0;
         var _loc38_:int = 0;
         var _loc39_:int = 0;
         var _loc40_:String = null;
         var _loc41_:Array = null;
         var _loc42_:McBaseItem = null;
         var _loc43_:Object = null;
         var _loc44_:int = 0;
         var _loc45_:int = 0;
         var _loc5_:String = "";
         switch(param2)
         {
            case 1:
               _loc6_ = param3.readUTF();
               _loc7_ = param3.readInt();
               _loc8_ = param3.readByte();
               _loc9_ = [];
               _loc37_ = 0;
               while(_loc37_ < _loc8_)
               {
                  _loc21_ = new Goods(param3.readInt());
                  _loc21_.count = param3.readInt();
                  _loc9_.push(_loc21_);
                  _loc37_++;
               }
               _loc10_ = param3.readByte();
               _loc11_ = param3.readByte();
               _loc12_ = param3.readUTF();
               _loc4_ = [_loc9_,true,_loc6_,0,_loc12_];
               break;
            case 2:
               _loc6_ = param3.readUTF();
               _loc13_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param3.readInt(),true);
               _loc14_ = param3.readInt();
               _loc15_ = [];
               _loc4_ = [_loc13_,_loc6_,_loc13_.count + "/" + _loc14_,_loc15_];
               _loc16_ = param3.readByte();
               _loc37_ = 0;
               while(_loc37_ < _loc16_)
               {
                  _loc38_ = param3.readInt();
                  _loc39_ = param3.readInt();
                  _loc22_ = param3.readByte() == 1;
                  _loc40_ = param3.readUTF();
                  _loc15_.push([_loc38_,_loc40_,true,0]);
                  _loc37_++;
               }
               _loc12_ = param3.readUTF();
               for each(_loc41_ in _loc15_)
               {
                  _loc41_[4] = _loc12_;
               }
               break;
            case 3:
            case 20:
            case 21:
            case 22:
            case 23:
            case 24:
            case 25:
            case 26:
            case 27:
            case 28:
            case 29:
            case 30:
            case 31:
            case 32:
            case 33:
            case 34:
            case 35:
            case 36:
            case 37:
            case 38:
            case 39:
            case 40:
            case 41:
            case 42:
            case 44:
            case 45:
            case 46:
            case 47:
            case 48:
            case 49:
            case 50:
            case 61:
            case 64:
            case 65:
            case 66:
            case 67:
            case 68:
            case 69:
            case 70:
            case 71:
            case 72:
            case 73:
            case 74:
            case 76:
            case 82:
            case 83:
            case 84:
            case 85:
            case 86:
            case 87:
            case 100:
            case 101:
            case 102:
               _loc6_ = param3.readUTF();
               _loc8_ = param3.readByte();
               _loc9_ = [];
               _loc37_ = 0;
               while(_loc37_ < _loc8_)
               {
                  _loc21_ = new Goods(param3.readInt());
                  _loc21_.count = param3.readInt();
                  _loc9_.push(_loc21_);
                  _loc37_++;
               }
               _loc10_ = param3.readShort();
               _loc11_ = param3.readShort();
               _loc5_ = param3.readUTF();
               _loc12_ = param3.readUTF();
               _loc4_ = [_loc9_,true,_loc6_,0,_loc12_,_loc5_];
               break;
            case 92:
               _loc6_ = param3.readUTF();
               _loc8_ = param3.readByte();
               _loc9_ = [];
               _loc37_ = 0;
               while(_loc37_ < _loc8_)
               {
                  _loc21_ = new Goods(param3.readInt());
                  _loc21_.count = param3.readShort();
                  _loc9_.push(_loc21_);
                  _loc37_++;
               }
               _loc10_ = param3.readShort();
               _loc11_ = param3.readShort();
               _loc17_ = param3.readInt();
               _loc18_ = param3.readInt();
               _loc5_ = param3.readUTF();
               _loc12_ = param3.readUTF();
               _loc4_ = [_loc9_,true,_loc6_,0,_loc12_,_loc5_,_loc18_,_loc17_];
               break;
            case 4:
               _loc6_ = param3.readUTF();
               _loc19_ = param3.readShort();
               _loc20_ = param3.readShort();
               _loc21_ = new Goods(param3.readInt());
               _loc21_.count = param3.readInt();
               _loc22_ = param3.readByte() == 1;
               _loc12_ = param3.readUTF();
               _loc4_ = [[_loc19_,_loc20_],_loc21_,true,0,_loc12_];
               break;
            case 5:
               _loc6_ = param3.readUTF();
               _loc23_ = param3.readShort();
               _loc24_ = param3.readShort();
               _loc21_ = new Goods(param3.readInt());
               _loc21_.count = param3.readInt();
               _loc22_ = param3.readByte() == 1;
               _loc12_ = param3.readUTF();
               _loc4_ = [_loc21_.getBigICOPath(),true,_loc6_,0,_loc12_];
               break;
            case 6:
               _loc6_ = param3.readUTF();
               _loc23_ = param3.readShort();
               _loc24_ = param3.readShort();
               _loc21_ = new Goods(param3.readInt());
               _loc21_.count = param3.readInt();
               _loc22_ = param3.readByte() == 1;
               _loc12_ = param3.readUTF();
               _loc4_ = [_loc21_.getBigICOPath(),true,_loc6_,0,_loc12_];
               break;
            case 7:
               _loc6_ = param3.readUTF();
               _loc23_ = param3.readShort();
               _loc24_ = param3.readShort();
               _loc21_ = new Goods(param3.readInt());
               _loc21_.count = param3.readInt();
               _loc22_ = param3.readByte() == 1;
               _loc12_ = param3.readUTF();
               _loc4_ = [_loc21_.getBigICOPath(),true,_loc6_,0,_loc12_];
               break;
            case 75:
               _loc6_ = param3.readUTF();
               _loc8_ = param3.readByte();
               _loc9_ = [];
               _loc21_ = new Goods(param3.readInt());
               _loc21_.count = param3.readInt();
               _loc10_ = param3.readShort();
               _loc11_ = param3.readShort();
               _loc5_ = param3.readUTF();
               _loc12_ = param3.readUTF();
               _loc4_ = [_loc21_.getBigICOPath(),true,_loc6_,0,_loc12_];
               break;
            case 8:
               _loc6_ = param3.readUTF();
               _loc21_ = new Goods(param3.readInt());
               _loc21_.count = param3.readInt();
               _loc22_ = param3.readByte() == 1;
               _loc12_ = param3.readUTF();
               _loc4_ = [_loc21_.getBigICOPath(),true,_loc6_,0,_loc12_];
               break;
            case 9:
               _loc6_ = param3.readUTF();
               _loc7_ = param3.readInt();
               _loc25_ = [];
               _loc16_ = param3.readByte();
               _loc37_ = 0;
               while(_loc37_ < _loc16_)
               {
                  _loc25_.push(new Goods(param3.readInt()));
                  _loc37_++;
               }
               _loc11_ = param3.readShort();
               _loc10_ = param3.readShort();
               _loc12_ = param3.readUTF();
               _loc15_ = [];
               _loc37_ = 0;
               while(_loc37_ < _loc16_)
               {
                  _loc15_.push([_loc25_[_loc37_],true,"",(_loc25_[_loc37_] as Goods).id,_loc12_]);
                  _loc37_++;
               }
               _loc4_ = [_loc6_,_loc15_];
               break;
            case 10:
               _loc6_ = param3.readUTF();
               _loc21_ = new Goods(param3.readInt());
               _loc26_ = param3.readShort();
               _loc27_ = param3.readShort();
               _loc12_ = param3.readUTF();
               _loc4_ = [_loc21_.getBigICOPath(),true,_loc6_,_loc21_.id,_loc12_];
               break;
            case 11:
               _loc6_ = param3.readUTF();
               _loc23_ = param3.readShort();
               _loc24_ = param3.readShort();
               _loc21_ = new Goods(param3.readInt());
               _loc21_.count = param3.readInt();
               _loc22_ = param3.readByte() == 1;
               _loc12_ = param3.readUTF();
               _loc4_ = [_loc21_.getBigICOPath(),true,_loc6_,0,_loc12_];
               break;
            case 12:
               _loc6_ = param3.readUTF();
               _loc23_ = param3.readShort();
               _loc24_ = param3.readShort();
               _loc21_ = new Goods(param3.readInt());
               _loc21_.count = param3.readInt();
               _loc22_ = param3.readByte() == 1;
               _loc12_ = param3.readUTF();
               _loc4_ = [_loc21_.getBigICOPath(),true,_loc6_,0,_loc12_];
               break;
            case 13:
               _loc6_ = param3.readUTF();
               _loc28_ = param3.readByte() == 1;
               _loc8_ = param3.readByte();
               _loc9_ = [];
               _loc37_ = 0;
               while(_loc37_ < _loc8_)
               {
                  _loc21_ = new Goods(param3.readInt());
                  _loc21_.count = param3.readInt();
                  _loc9_.push(_loc21_);
                  _loc37_++;
               }
               _loc29_ = param3.readByte() == 1;
               _loc12_ = param3.readUTF();
               _loc4_ = [_loc9_,true,_loc6_,0,_loc12_];
               break;
            case 14:
               _loc6_ = param3.readUTF();
               _loc30_ = param3.readInt();
               _loc31_ = param3.readInt();
               _loc8_ = param3.readByte();
               _loc9_ = [];
               _loc37_ = 0;
               while(_loc37_ < _loc8_)
               {
                  _loc21_ = new Goods(param3.readInt());
                  _loc21_.count = param3.readInt();
                  _loc9_.push(_loc21_);
                  _loc37_++;
               }
               _loc29_ = param3.readByte() == 1;
               _loc12_ = param3.readUTF();
               _loc4_ = [_loc9_,true,_loc6_,0,_loc12_];
               break;
            case 15:
               _loc6_ = param3.readUTF();
               _loc32_ = param3.readByte();
               _loc8_ = param3.readByte();
               _loc9_ = [];
               _loc37_ = 0;
               while(_loc37_ < _loc8_)
               {
                  _loc21_ = new Goods(param3.readInt());
                  _loc21_.count = param3.readInt();
                  _loc9_.push(_loc21_);
                  _loc37_++;
               }
               _loc10_ = param3.readShort();
               _loc11_ = param3.readShort();
               _loc12_ = param3.readUTF();
               _loc4_ = [_loc9_,true,_loc6_,0,_loc12_];
               break;
            case 16:
               _loc6_ = param3.readUTF();
               _loc32_ = param3.readByte();
               _loc8_ = param3.readByte();
               _loc9_ = [];
               _loc37_ = 0;
               while(_loc37_ < _loc8_)
               {
                  _loc21_ = new Goods(param3.readInt());
                  _loc21_.count = param3.readInt();
                  _loc9_.push(_loc21_);
                  _loc37_++;
               }
               _loc10_ = param3.readShort();
               _loc11_ = param3.readShort();
               _loc12_ = param3.readUTF();
               _loc4_ = [_loc9_,true,_loc6_,0,_loc12_];
               break;
            case 17:
               _loc6_ = param3.readUTF();
               _loc32_ = param3.readByte();
               _loc8_ = param3.readByte();
               _loc9_ = [];
               _loc37_ = 0;
               while(_loc37_ < _loc8_)
               {
                  _loc21_ = new Goods(param3.readInt());
                  _loc21_.count = param3.readInt();
                  _loc9_.push(_loc21_);
                  _loc37_++;
               }
               _loc10_ = param3.readShort();
               _loc11_ = param3.readShort();
               _loc12_ = param3.readUTF();
               _loc4_ = [_loc9_,true,_loc6_,0,_loc12_];
               break;
            case 18:
               _loc6_ = param3.readUTF();
               _loc32_ = param3.readByte();
               _loc8_ = param3.readByte();
               _loc9_ = [];
               _loc37_ = 0;
               while(_loc37_ < _loc8_)
               {
                  _loc21_ = new Goods(param3.readInt());
                  _loc21_.count = param3.readInt();
                  _loc9_.push(_loc21_);
                  _loc37_++;
               }
               _loc10_ = param3.readShort();
               _loc11_ = param3.readShort();
               _loc12_ = param3.readUTF();
               _loc4_ = [_loc9_,true,_loc6_,0,_loc12_];
               break;
            case 19:
               _loc6_ = param3.readUTF();
               _loc32_ = param3.readByte();
               _loc8_ = param3.readByte();
               _loc9_ = [];
               _loc37_ = 0;
               while(_loc37_ < _loc8_)
               {
                  _loc21_ = new Goods(param3.readInt());
                  _loc21_.count = param3.readInt();
                  _loc9_.push(_loc21_);
                  _loc37_++;
               }
               _loc10_ = param3.readShort();
               _loc11_ = param3.readShort();
               _loc12_ = param3.readUTF();
               _loc4_ = [_loc9_,true,_loc6_,0,_loc12_];
               break;
            case 51:
               _loc33_ = param3.readInt();
               _loc6_ = param3.readUTF();
               _loc12_ = param3.readUTF();
               _loc4_ = [_loc6_,_loc33_];
               break;
            case 52:
               _loc6_ = param3.readUTF();
               _loc34_ = param3.readInt();
               _loc12_ = param3.readUTF();
               _loc4_ = [new Goods(_loc34_),_loc6_];
               break;
            case 53:
               _loc6_ = param3.readUTF();
               _loc34_ = param3.readInt();
               _loc12_ = param3.readUTF();
               _loc4_ = [new Goods(_loc34_),_loc6_];
               break;
            case 43:
               _loc6_ = param3.readUTF();
               _loc8_ = param3.readByte();
               _loc9_ = [];
               _loc37_ = 0;
               while(_loc37_ < _loc8_)
               {
                  _loc42_ = new McBaseItem(param3.readInt());
                  _loc42_.count = param3.readInt();
                  _loc42_.name = param3.readUTF();
                  _loc42_.dengji = param3.readByte();
                  _loc42_.quality = param3.readByte();
                  _loc42_.daojuId = param3.readInt();
                  _loc42_.miaoshu = param3.readUTF();
                  _loc9_.push(_loc42_);
                  _loc37_++;
               }
               _loc10_ = param3.readShort();
               _loc11_ = param3.readShort();
               _loc5_ = param3.readUTF();
               _loc12_ = param3.readUTF();
               _loc4_ = [_loc9_,true,_loc6_,0,_loc12_,_loc5_];
               break;
            case 62:
               _loc6_ = "";
               _loc35_ = 2;
               _loc36_ = [];
               _loc37_ = 0;
               while(_loc37_ < _loc35_)
               {
                  _loc43_ = new Object();
                  _loc43_.miaoshu = param3.readUTF();
                  _loc44_ = param3.readByte();
                  _loc9_ = new Array();
                  _loc45_ = 0;
                  while(_loc45_ < _loc44_)
                  {
                     _loc9_.push(param3.readInt());
                     _loc45_++;
                  }
                  _loc43_.goods = _loc9_;
                  _loc36_.push(_loc43_);
                  _loc37_++;
               }
               _loc12_ = param3.readUTF();
               _loc4_ = [_loc36_,_loc6_,_loc12_,0];
         }
         return _loc4_;
      }
      
      public function received_huodongJindu(param1:int, param2:Array) : void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         if(this._huodongID != param1)
         {
            return;
         }
         for each(_loc3_ in this._openHuodongList)
         {
            _loc4_ = int(_loc3_[0]);
            if(_loc4_ == this._huodongID)
            {
               _loc5_ = _loc3_[2];
               if(_loc5_ != "")
               {
                  param2.push([0,51,[_loc5_]]);
               }
               break;
            }
         }
         this.xianshiDajiangDuihuanPanel.showHuodong(this._huodongID,param2);
         this.removeLoaderBuff();
      }
      
      public function received_huodongDuihuanCG(param1:int, param2:int, param3:int) : void
      {
         if(this._huodongID != param1)
         {
            return;
         }
         NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"领取成功"),false);
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"领取成功"),false);
      }
      
      public function addLoadBuffer() : void
      {
         this.removeLoaderBuff();
         this.loaderBuff = LoadBuffer.show(this.xianshiDajiangDuihuanPanel);
      }
      
      public function removeLoaderBuff() : void
      {
         if(this.loaderBuff)
         {
            this.loaderBuff.close();
         }
         this.loaderBuff = null;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Gift_ApplicationFacade.SHOW_XIANSHIDAJIANGDUIHUAN_TYPE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Gift_ApplicationFacade.SHOW_XIANSHIDAJIANGDUIHUAN_TYPE:
               this.isRequstOtherType = true;
               this.requstTypeId = _loc2_ as int;
               PipeManager.sendMsg(PipeConstants.SHOW_XIANSHIDAJIANGDUIHUAN);
               _loc3_ = _loc2_ as int;
               this.msgSenderProxy.send_53061(_loc3_);
         }
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(XianshiDajiangDuihuanPanel,function():void
         {
            xianshiDajiangDuihuanPanel.addEventListener(Event.ADDED_TO_STAGE,huodongHandle);
            xianshiDajiangDuihuanPanel.addEventListener(XianshiDajiangDuihuanPanel.UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,huodongHandle);
            xianshiDajiangDuihuanPanel.addEventListener(XianshiDajiangDuihuanPanel.UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_DUIHUAN_SHOW,huodongHandle);
            xianshiDajiangDuihuanPanel.addEventListener(XianshiDajiangDuihuanPanel.UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_BTN_LINGQU,huodongHandle);
            xianshiDajiangDuihuanPanel.addEventListener(XianshiDajiangDuihuanPanel.UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_BTN_GOUMAI,huodongHandle);
            xianshiDajiangDuihuanPanel.addEventListener(XianshiDajiangDuihuanPanel.UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_DAKAI_MIANBAN,huodongHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(XianshiDajiangDuihuanPanel,function():void
         {
            xianshiDajiangDuihuanPanel.removeEventListener(Event.ADDED_TO_STAGE,huodongHandle);
            xianshiDajiangDuihuanPanel.removeEventListener(XianshiDajiangDuihuanPanel.UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW,huodongHandle);
            xianshiDajiangDuihuanPanel.removeEventListener(XianshiDajiangDuihuanPanel.UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_DUIHUAN_SHOW,huodongHandle);
            xianshiDajiangDuihuanPanel.removeEventListener(XianshiDajiangDuihuanPanel.UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_BTN_LINGQU,huodongHandle);
            xianshiDajiangDuihuanPanel.removeEventListener(XianshiDajiangDuihuanPanel.UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_BTN_GOUMAI,huodongHandle);
            xianshiDajiangDuihuanPanel.removeEventListener(XianshiDajiangDuihuanPanel.UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_DAKAI_MIANBAN,huodongHandle);
         });
      }
      
      private function huodongHandle(param1:Event = null) : void
      {
         var baseE:BaseEvent = null;
         var id:int = 0;
         var typeId:int = 0;
         var arr:Array = null;
         var huodongID:int = 0;
         var tiaomuID:int = 0;
         var lingquID:int = 0;
         var tishi:String = null;
         var e:Event = param1;
         var type:String = e.type;
         baseE = e as BaseEvent;
         switch(type)
         {
            case Event.ADDED_TO_STAGE:
               this.f5DajiangState();
               break;
            case XianshiDajiangDuihuanPanel.UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_SHOW:
               this.addLoadBuffer();
               typeId = baseE.data as int;
               if(this.isRequstOtherType)
               {
                  this.msgSenderProxy.send_53061(this.requstTypeId);
                  this.isRequstOtherType = false;
                  this.requstTypeId = 0;
               }
               else
               {
                  this.msgSenderProxy.send_53061(typeId);
               }
               break;
            case XianshiDajiangDuihuanPanel.UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_DUIHUAN_SHOW:
               this._huodongID = baseE.data as int;
               this.addLoadBuffer();
               this.msgSenderProxy.send_52055(this._huodongID);
               this.xianshiDajiangDuihuanPanel.setBtnXuanzhong(this._huodongID);
               break;
            case XianshiDajiangDuihuanPanel.UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_BTN_LINGQU:
               arr = baseE.data as Array;
               huodongID = int(arr[0]);
               tiaomuID = int(arr[1]);
               lingquID = int(arr[2]);
               tishi = arr[3];
               if(tishi != null && tishi != "")
               {
                  FAlert.show(tishi,"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        msgSenderProxy.send_52053([huodongID,tiaomuID,lingquID]);
                     }
                  });
               }
               else
               {
                  this.msgSenderProxy.send_52053([huodongID,tiaomuID,lingquID]);
               }
               break;
            case XianshiDajiangDuihuanPanel.UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_BTN_GOUMAI:
               arr = baseE.data as Array;
               huodongID = int(arr[0]);
               tiaomuID = int(arr[1]);
               lingquID = int(arr[2]);
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[lingquID,1,tiaomuID]);
               break;
            case XianshiDajiangDuihuanPanel.UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_DAKAI_MIANBAN:
               arr = baseE.data as Array;
               if(arr[0] == 44)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_SISHENGSHOUKEWEN_PANEL1);
               }
         }
      }
   }
}

