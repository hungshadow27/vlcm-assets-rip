package com.tgame.moudels.banghui.model
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.BangzhongZhiwu;
   import com.tgame.common.staticdata.HeadResChange;
   import com.tgame.common.staticdata.MonsterType;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.ui.componets.SmallLoadingBar;
   import com.tgame.common.vo.character.Monster;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.character.info.BanghuiInfo;
   import com.tgame.manager.HeadFaceManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.moudels.banghui.Banghui_ApplicationFacade;
   import com.tgame.moudels.banghui.view.Banghui_BanghuiCreatPanelMediator;
   import com.tgame.moudels.banghui.view.Banghui_BanghuiInfoPanelMediator;
   import com.tgame.moudels.banghui.view.Banghui_BanghuiListPanelMediator;
   import com.tgame.moudels.banghui.view.Banghui_BanghuiMemberListPanelMediator;
   import com.tgame.moudels.banghui.view.Banghui_BanghuiNewsPanelMediator;
   import com.tgame.moudels.banghui.view.Banghui_BangqiAnchaPanelMediator;
   import com.tgame.moudels.banghui.view.Banghui_BangqiBanggongPanelMediator;
   import com.tgame.moudels.banghui.view.Banghui_BangqiInfoPanelMediator;
   import com.tgame.moudels.banghui.view.Banghui_GongchengGongchengchePanelMediator;
   import com.tgame.moudels.banghui.view.Banghui_GongchengTimePanelMediator;
   import com.tgame.moudels.banghui.view.Banghui_GongchengXiangyangguishuPanelMediator;
   import com.tgame.moudels.login.view.*;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import flash.geom.Point;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Banghui_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Banghui_MsgReceivedProxy";
      
      private var _banghuiListPanelMediator:Banghui_BanghuiListPanelMediator;
      
      private var _banghuiCreatPanelMediator:Banghui_BanghuiCreatPanelMediator;
      
      private var _banghuiInfoPanelMediator:Banghui_BanghuiInfoPanelMediator;
      
      private var _banghuiNewsPanelMediator:Banghui_BanghuiNewsPanelMediator;
      
      private var _banghuiMemberListPanelMediator:Banghui_BanghuiMemberListPanelMediator;
      
      private var _bangqiInfoPanelMediator:Banghui_BangqiInfoPanelMediator;
      
      private var _bangqiAnchaPanelMediator:Banghui_BangqiAnchaPanelMediator;
      
      private var _bangqiBanggongPanelMediator:Banghui_BangqiBanggongPanelMediator;
      
      private var _gongchengXiangyangguishuPanelMediator:Banghui_GongchengXiangyangguishuPanelMediator;
      
      private var _gongchengGongchengchePanelMediator:Banghui_GongchengGongchengchePanelMediator;
      
      private var _gongchengTimePanelMediator:Banghui_GongchengTimePanelMediator;
      
      public function Banghui_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      private function get banghuiListPanelMediator() : Banghui_BanghuiListPanelMediator
      {
         if(!this._banghuiListPanelMediator)
         {
            this._banghuiListPanelMediator = facade.retrieveMediator(Banghui_BanghuiListPanelMediator.NAME) as Banghui_BanghuiListPanelMediator;
         }
         return this._banghuiListPanelMediator;
      }
      
      private function get banghuiCreatPanelMediator() : Banghui_BanghuiCreatPanelMediator
      {
         if(!this._banghuiCreatPanelMediator)
         {
            this._banghuiCreatPanelMediator = facade.retrieveMediator(Banghui_BanghuiCreatPanelMediator.NAME) as Banghui_BanghuiCreatPanelMediator;
         }
         return this._banghuiCreatPanelMediator;
      }
      
      private function get banghuiInfoPanelMediator() : Banghui_BanghuiInfoPanelMediator
      {
         if(!this._banghuiInfoPanelMediator)
         {
            this._banghuiInfoPanelMediator = facade.retrieveMediator(Banghui_BanghuiInfoPanelMediator.NAME) as Banghui_BanghuiInfoPanelMediator;
         }
         return this._banghuiInfoPanelMediator;
      }
      
      private function get banghuiNewsPanelMediator() : Banghui_BanghuiNewsPanelMediator
      {
         if(!this._banghuiNewsPanelMediator)
         {
            this._banghuiNewsPanelMediator = facade.retrieveMediator(Banghui_BanghuiNewsPanelMediator.NAME) as Banghui_BanghuiNewsPanelMediator;
         }
         return this._banghuiNewsPanelMediator;
      }
      
      private function get banghuiMemberListPanelMediator() : Banghui_BanghuiMemberListPanelMediator
      {
         if(!this._banghuiMemberListPanelMediator)
         {
            this._banghuiMemberListPanelMediator = facade.retrieveMediator(Banghui_BanghuiMemberListPanelMediator.NAME) as Banghui_BanghuiMemberListPanelMediator;
         }
         return this._banghuiMemberListPanelMediator;
      }
      
      private function get bangqiInfoPanelMediator() : Banghui_BangqiInfoPanelMediator
      {
         if(!this._bangqiInfoPanelMediator)
         {
            this._bangqiInfoPanelMediator = facade.retrieveMediator(Banghui_BangqiInfoPanelMediator.NAME) as Banghui_BangqiInfoPanelMediator;
         }
         return this._bangqiInfoPanelMediator;
      }
      
      private function get bangqiAnchaPanelMediator() : Banghui_BangqiAnchaPanelMediator
      {
         if(!this._bangqiAnchaPanelMediator)
         {
            this._bangqiAnchaPanelMediator = facade.retrieveMediator(Banghui_BangqiAnchaPanelMediator.NAME) as Banghui_BangqiAnchaPanelMediator;
         }
         return this._bangqiAnchaPanelMediator;
      }
      
      private function get bangqiBanggongPanelMediator() : Banghui_BangqiBanggongPanelMediator
      {
         if(!this._bangqiBanggongPanelMediator)
         {
            this._bangqiBanggongPanelMediator = facade.retrieveMediator(Banghui_BangqiBanggongPanelMediator.NAME) as Banghui_BangqiBanggongPanelMediator;
         }
         return this._bangqiBanggongPanelMediator;
      }
      
      private function get gongchengXiangyangguishuPanelMediator() : Banghui_GongchengXiangyangguishuPanelMediator
      {
         if(!this._gongchengXiangyangguishuPanelMediator)
         {
            this._gongchengXiangyangguishuPanelMediator = facade.retrieveMediator(Banghui_GongchengXiangyangguishuPanelMediator.NAME) as Banghui_GongchengXiangyangguishuPanelMediator;
         }
         return this._gongchengXiangyangguishuPanelMediator;
      }
      
      private function get gongchengGongchengchePanelMediator() : Banghui_GongchengGongchengchePanelMediator
      {
         if(!this._gongchengGongchengchePanelMediator)
         {
            this._gongchengGongchengchePanelMediator = facade.retrieveMediator(Banghui_GongchengGongchengchePanelMediator.NAME) as Banghui_GongchengGongchengchePanelMediator;
         }
         return this._gongchengGongchengchePanelMediator;
      }
      
      private function get gongchengTimePanelMediator() : Banghui_GongchengTimePanelMediator
      {
         if(!this._gongchengTimePanelMediator)
         {
            this._gongchengTimePanelMediator = facade.retrieveMediator(Banghui_GongchengTimePanelMediator.NAME) as Banghui_GongchengTimePanelMediator;
         }
         return this._gongchengTimePanelMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([51032,51034,51036,51070,51038,51040,51042,51044,51046,51048,51050,51052,51054,51056,51058,51060,51062,51068,51072,51074,51076,51080,51082,51084,51086,51088,51090,51092,51094,51096,51098,51100,51102,51104,51144,51146,51106,51148,51108,51110,51112,51114,51116,51118,51120,51122,51124,51126,51128,51130,51140,51142,51134,71022,51218],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([51032,51034,51036,51070,51038,51040,51042,51044,51046,51048,51050,51052,51054,51056,51058,51060,51062,51068,51072,51074,51076,51080,51082,51084,51086,51088,51090,51092,51094,51096,51098,51100,51102,51104,51144,51146,51106,51148,51108,51110,51112,51114,51116,51118,51120,51122,51124,51126,51128,51130,51140,51142,51134,71022,51218],NAME);
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
      
      public function received_51032(param1:ByteArray) : void
      {
         var _loc13_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:String = null;
         var _loc17_:int = 0;
         var _loc18_:String = null;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:String = null;
         var _loc27_:int = 0;
         ZLog.add("51032： 返回帮会列表");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = _loc2_.readShort();
         var _loc5_:int = _loc2_.readShort();
         var _loc6_:int = _loc2_.readShort();
         var _loc7_:int = _loc2_.readInt();
         var _loc8_:int = _loc2_.readInt();
         var _loc9_:int = _loc2_.readInt();
         var _loc10_:int = _loc2_.readInt();
         var _loc11_:int = _loc2_.readInt();
         var _loc12_:int = _loc2_.readInt();
         var _loc14_:Array = [];
         _loc13_ = 0;
         while(_loc13_ < _loc12_)
         {
            _loc15_ = _loc2_.readInt();
            _loc16_ = _loc2_.readUTF();
            _loc17_ = _loc2_.readInt();
            _loc18_ = _loc2_.readUTF();
            _loc19_ = _loc2_.readShort();
            _loc20_ = _loc2_.readByte();
            _loc21_ = _loc2_.readByte();
            _loc22_ = _loc2_.readShort();
            _loc23_ = _loc2_.readShort();
            _loc24_ = _loc2_.readInt();
            _loc25_ = _loc2_.readByte();
            _loc26_ = _loc2_.readUTF();
            _loc27_ = _loc2_.readInt();
            _loc14_.push([_loc15_,_loc16_,_loc17_,_loc18_,_loc19_,_loc20_,_loc21_,_loc22_,_loc23_,_loc24_,_loc25_,_loc26_,_loc27_]);
            _loc13_++;
         }
         this.banghuiListPanelMediator.receive_banghuiList(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc14_);
      }
      
      public function received_51034(param1:ByteArray) : void
      {
         var _loc24_:int = 0;
         var _loc29_:int = 0;
         var _loc32_:int = 0;
         var _loc33_:String = null;
         var _loc34_:int = 0;
         var _loc35_:int = 0;
         var _loc36_:String = null;
         var _loc37_:int = 0;
         ZLog.add("51034： 返回指定帮会ID的帮会信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readByte();
         var _loc5_:String = _loc2_.readUTF();
         var _loc6_:int = _loc2_.readByte();
         var _loc7_:String = _loc2_.readUTF();
         var _loc8_:int = _loc2_.readInt();
         var _loc9_:int = _loc2_.readShort();
         var _loc10_:int = _loc2_.readShort();
         var _loc11_:int = _loc2_.readShort();
         var _loc12_:int = _loc2_.readShort();
         var _loc13_:int = _loc2_.readShort();
         var _loc14_:int = _loc2_.readShort();
         var _loc15_:int = _loc2_.readShort();
         var _loc16_:int = _loc2_.readShort();
         var _loc17_:int = _loc2_.readShort();
         var _loc18_:int = _loc2_.readShort();
         var _loc19_:String = _loc2_.readUTF();
         var _loc20_:Number = _loc2_.readDouble();
         var _loc21_:String = _loc2_.readUTF();
         var _loc22_:int = _loc2_.readShort();
         var _loc23_:int = _loc2_.readInt();
         _loc24_ = _loc2_.readInt();
         var _loc25_:String = _loc2_.readUTF();
         var _loc26_:String = _loc2_.readUTF();
         var _loc27_:String = _loc2_.readUTF();
         var _loc28_:int = _loc2_.readByte();
         var _loc30_:Array = [];
         _loc29_ = 0;
         while(_loc29_ < _loc28_)
         {
            _loc32_ = _loc2_.readInt();
            _loc33_ = _loc2_.readUTF();
            _loc34_ = _loc2_.readShort();
            _loc35_ = _loc2_.readByte();
            _loc36_ = _loc2_.readUTF();
            _loc37_ = _loc2_.readInt();
            _loc30_.push([_loc32_,_loc33_,_loc34_,_loc35_,_loc36_,_loc37_]);
            _loc29_++;
         }
         var _loc31_:int = _loc2_.readByte();
         _loc24_ = _loc2_.readByte();
         this.banghuiInfoPanelMediator.receive_banghuiInfo(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_,_loc15_,_loc16_,_loc17_,_loc18_,_loc19_,_loc20_,_loc21_,_loc22_,_loc23_,_loc24_,_loc25_,_loc26_,_loc27_,_loc30_,_loc31_,_loc24_);
      }
      
      public function received_51036(param1:ByteArray) : void
      {
         var _loc14_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:String = null;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:String = null;
         var _loc25_:Number = NaN;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         ZLog.add("51036： 返回帮会成员列表");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = _loc2_.readShort();
         var _loc5_:int = _loc2_.readShort();
         var _loc6_:int = _loc2_.readShort();
         var _loc7_:int = _loc2_.readInt();
         var _loc8_:Number = _loc2_.readDouble();
         var _loc9_:int = _loc2_.readInt();
         var _loc10_:int = _loc2_.readInt();
         var _loc11_:int = _loc2_.readInt();
         var _loc12_:int = _loc2_.readInt();
         var _loc13_:int = _loc2_.readInt();
         var _loc15_:Array = [];
         _loc14_ = 0;
         while(_loc14_ < _loc13_)
         {
            _loc17_ = _loc2_.readInt();
            _loc18_ = _loc2_.readUTF();
            _loc19_ = _loc2_.readShort();
            _loc20_ = _loc2_.readByte();
            _loc21_ = _loc2_.readByte();
            _loc22_ = _loc2_.readByte();
            _loc23_ = _loc2_.readByte();
            _loc24_ = _loc2_.readUTF();
            _loc25_ = _loc2_.readDouble();
            _loc26_ = _loc2_.readInt();
            _loc27_ = _loc2_.readInt();
            _loc28_ = _loc2_.readShort();
            _loc29_ = _loc2_.readShort();
            _loc15_.push([_loc17_,_loc18_,_loc19_,_loc20_,_loc21_,_loc22_,_loc23_,_loc24_,_loc25_,_loc26_,_loc27_,_loc28_,_loc29_]);
            _loc14_++;
         }
         var _loc16_:int = _loc2_.readByte();
         this.banghuiMemberListPanelMediator.receive_banghuiMemberList(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc15_,_loc16_);
      }
      
      public function received_51038(param1:ByteArray) : void
      {
         var _loc4_:String = null;
         ZLog.add("51038： 返回创建帮会相应");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         if(_loc3_ == 1)
         {
            this.banghuiCreatPanelMediator.receive_creatBanghuiSucc(_loc2_.readInt(),_loc2_.readUTF(),_loc2_.readByte(),_loc2_.readUTF(),_loc2_.readByte(),_loc2_.readUTF());
         }
         else
         {
            _loc4_ = NetWorkManager.readGILMsg(_loc2_);
            this.banghuiCreatPanelMediator.receive_creatBanghuiFail(_loc4_);
         }
      }
      
      public function received_51070(param1:ByteArray) : void
      {
         var _loc5_:String = null;
         ZLog.add("51070： 返回检测重名相应");
         var _loc2_:ByteArray = param1;
         var _loc3_:String = _loc2_.readUTF();
         var _loc4_:int = _loc2_.readByte();
         if(_loc4_ == 0)
         {
            _loc5_ = NetWorkManager.readGILMsg(_loc2_);
         }
         this.banghuiCreatPanelMediator.receive_checkName(_loc3_,_loc4_ == 1,_loc5_);
      }
      
      public function received_51040(param1:ByteArray) : void
      {
         var _buf:ByteArray;
         var id:int = 0;
         var name:String = null;
         var lv:int = 0;
         var party:String = null;
         var head:String = null;
         var $data:ByteArray = param1;
         ZLog.add("51040： 返回申请入帮请求S-B");
         _buf = $data;
         id = _buf.readInt();
         name = _buf.readUTF();
         lv = _buf.readShort();
         party = PartyType.getName(_buf.readByte());
         head = HeadResChange.headResChangeToString(_buf.readByte());
         GameInstance.uiInstance.mainUI.showICOTip(MainUI.TYPE_PARTY_TIP,function():void
         {
            banghuiMemberListPanelMediator.showApplicationPanel(id,head,name,String(lv),party,LanResManager.getLanCommonTextWords("无"));
         });
      }
      
      public function received_51042(param1:ByteArray) : void
      {
         var _buf:ByteArray;
         var tag:int;
         var banghuiID:int = 0;
         var banghuiName:String = null;
         var bangqiLv:int = 0;
         var bangqiName:String = null;
         var bangqiID:int = 0;
         var bangqiStyle:String = null;
         var banghuiInfo:BanghuiInfo = null;
         var failStr:String = null;
         var $data:ByteArray = param1;
         ZLog.add("51042： 返回申请入帮请求S-A");
         _buf = $data;
         tag = _buf.readByte();
         if(tag == 1)
         {
            banghuiID = _buf.readInt();
            banghuiName = _buf.readUTF();
            bangqiLv = _buf.readByte();
            bangqiName = _buf.readUTF();
            bangqiID = _buf.readByte();
            bangqiStyle = _buf.readUTF();
            banghuiInfo = GameInstance.mainCharData.banghuiInfo;
            banghuiInfo.banghuiId = banghuiID;
            banghuiInfo.banghuiName = banghuiName;
            banghuiInfo.zhiwu = BangzhongZhiwu.ZW0;
            banghuiInfo.bangqiLv = bangqiLv;
            banghuiInfo.bangqiName = bangqiName;
            banghuiInfo.bangqiImgID = bangqiID;
            banghuiInfo.bangqiImgColor = bangqiStyle.split(",").map(function(param1:*, param2:int, param3:Array):int
            {
               return int(Number(param1));
            });
         }
         else
         {
            failStr = NetWorkManager.readGILMsg(_buf);
            NoticeManager.notify(NoticeManager.FOOT,failStr);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,failStr);
         }
      }
      
      public function received_51044(param1:ByteArray) : void
      {
         var _buf:ByteArray;
         var id:int = 0;
         var name:String = null;
         var lv:int = 0;
         var party:String = null;
         var banghuiID:int = 0;
         var banghuiName:String = null;
         var head:String = null;
         var $data:ByteArray = param1;
         ZLog.add("51044： 返回申请入帮请求S-B");
         _buf = $data;
         id = _buf.readInt();
         name = _buf.readUTF();
         lv = _buf.readShort();
         party = PartyType.getName(_buf.readByte());
         banghuiID = _buf.readInt();
         banghuiName = _buf.readUTF();
         head = HeadResChange.headResChangeToString(_buf.readByte());
         GameInstance.uiInstance.mainUI.showICOTip(MainUI.TYPE_PARTY_TIP,function():void
         {
            banghuiMemberListPanelMediator.showInvitePanel(id,banghuiID,head,name,String(lv),party,banghuiName);
         });
      }
      
      public function received_51048(param1:ByteArray) : void
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:String = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         ZLog.add("51048： 返回查询玩家S-A");
         var _loc2_:ByteArray = param1;
         var _loc3_:String = _loc2_.readUTF();
         var _loc4_:int = _loc2_.readShort();
         var _loc5_:Array = [];
         var _loc6_:int = _loc2_.readByte();
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc8_ = _loc2_.readInt();
            _loc9_ = _loc2_.readUTF();
            _loc10_ = _loc2_.readShort();
            _loc11_ = _loc2_.readByte();
            _loc5_.push([_loc8_,_loc9_,_loc10_,_loc11_]);
            _loc7_++;
         }
         this.banghuiMemberListPanelMediator.setSearchPanelList(_loc3_,_loc4_,_loc5_);
      }
      
      public function received_51050(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:String = null;
         ZLog.add("51050： 返回开除响应S-B");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         if(_loc3_ == 1)
         {
            _loc4_ = _loc2_.readInt();
            _loc5_ = _loc2_.readUTF();
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"玩家已被您成功开除出帮",[_loc5_]),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"玩家已被您成功开除出帮",[_loc5_]),false);
            if(Fun.isVisible(GameInstance.uiInstance._banghuiMemberListPanel))
            {
               this.banghuiMemberListPanelMediator.f5();
            }
         }
         else
         {
            _loc6_ = NetWorkManager.readGILMsg(_loc2_);
            NoticeManager.notify(NoticeManager.FOOT,_loc6_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc6_);
         }
      }
      
      public function received_51052(param1:ByteArray) : void
      {
         ZLog.add("51052： 返回开除响应S-A");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您已被帮主开除出帮"),false);
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您已被帮主开除出帮"),false);
      }
      
      public function received_51056(param1:ByteArray) : void
      {
         ZLog.add("51056： 返回解散帮会响应S-B&&AAAA");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"帮会被解散"),false);
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"帮会被解散"),false);
      }
      
      public function received_51058(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:String = null;
         ZLog.add("51058： 返回退帮响应S-A");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         if(_loc3_ == 1)
         {
            _loc4_ = _loc2_.readInt();
         }
         else
         {
            _loc5_ = NetWorkManager.readGILMsg(_loc2_);
            NoticeManager.notify(NoticeManager.FOOT,_loc5_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc5_);
         }
      }
      
      public function received_51062(param1:ByteArray) : void
      {
         var _loc6_:String = null;
         ZLog.add("51062： 返回更改职务相应S-B&&AAAA");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:String = _loc2_.readUTF();
         var _loc5_:int = _loc2_.readByte();
         if(GameInstance.mainChar.id == _loc3_)
         {
            GameInstance.mainCharData.banghuiInfo.zhiwu = _loc5_;
         }
         if(_loc5_ == BangzhongZhiwu.ZW1)
         {
            _loc6_ = LanResManager.getLanTextWords(this,"玩家成为本帮新帮主",[_loc4_]);
         }
         else if(_loc5_ != BangzhongZhiwu.ZW0)
         {
            _loc6_ = LanResManager.getLanTextWords(this,"玩家担任了本帮的职务",[_loc4_,BangzhongZhiwu.getNameByValue(_loc5_)]);
         }
         if(_loc6_ != null && _loc6_ != "")
         {
            this.banghuiNewsPanelMediator.receive_banghuiGonggao(_loc6_);
         }
         if(Fun.isVisible(GameInstance.uiInstance._banghuiMemberListPanel))
         {
            this.banghuiMemberListPanelMediator.f5();
         }
      }
      
      public function received_51074(param1:ByteArray) : void
      {
         var _loc4_:String = null;
         ZLog.add("51074： 返回更改称号相应S-B");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         if(_loc3_ == 1)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"帮众称号更改成功"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"帮众称号更改成功"),false);
            if(Fun.isVisible(GameInstance.uiInstance._banghuiMemberListPanel))
            {
               this.banghuiMemberListPanelMediator.f5();
            }
         }
         else
         {
            _loc4_ = _loc2_.readUTF();
            NoticeManager.notify(NoticeManager.FOOT,_loc4_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc4_);
         }
      }
      
      public function received_51076(param1:ByteArray) : void
      {
         var _loc4_:String = null;
         ZLog.add("51076： 返回更改公告相应S-B");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         if(_loc3_ == 1)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"帮会公告修改成功"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"帮会公告修改成功"),false);
         }
         else
         {
            _loc4_ = _loc2_.readUTF();
            NoticeManager.notify(NoticeManager.FOOT,_loc4_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc4_);
         }
      }
      
      public function received_51068(param1:ByteArray) : void
      {
         var _loc9_:Array = null;
         var _loc10_:Array = null;
         var _loc11_:SceneCharacter = null;
         var _loc12_:AttributeInfo = null;
         var _loc13_:Boolean = false;
         ZLog.add("51068： 通知视野内玩家角色入帮");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readByte();
         var _loc5_:int = _loc2_.readInt();
         var _loc6_:String = _loc2_.readUTF();
         var _loc7_:SceneCharacter = GameInstance.scene.getCharByID(_loc3_);
         if(!_loc7_)
         {
            return;
         }
         var _loc8_:BanghuiInfo = (_loc7_.data as Player).banghuiInfo;
         if(_loc4_ == 0)
         {
            _loc8_.clear();
         }
         else
         {
            _loc8_.banghuiId = _loc5_;
            _loc8_.banghuiName = _loc6_;
         }
         HeadFaceManager.updateCharCustomHtmlText(_loc3_);
         if(_loc3_ == GameInstance.mainChar.id)
         {
            _loc9_ = [];
            _loc10_ = [];
            for each(_loc11_ in GameInstance.scene.sceneCharacters)
            {
               if(_loc11_.type == SceneCharacterType.PLAYER)
               {
                  _loc9_.push(_loc11_.id);
               }
               else if(_loc11_.type == SceneCharacterType.MONSTER && (_loc11_.data as Monster).res.type == MonsterType.BANGQI)
               {
                  _loc10_.push(_loc11_);
               }
            }
            HeadFaceManager.updatePlayersName(_loc9_);
            PipeManager.sendMsg(PipeConstants.SET_SMALL_MAP_BANGQI,[OtherConst.BANGQI_ALL_REMOVE]);
            for each(_loc11_ in _loc10_)
            {
               _loc12_ = (_loc11_.data as Monster).attributeInfo;
               _loc13_ = GameInstance.mainCharData.banghuiInfo.isTongbang(_loc12_.bangqi_suoshuBanghuiID);
               PipeManager.sendMsg(PipeConstants.SET_SMALL_MAP_BANGQI,[OtherConst.BANGQI_ADD,_loc11_.id,new Point(_loc11_.piexl_x,_loc11_.piexl_y),_loc13_ ? _loc12_.bangqi_tipsArr : _loc12_.bangqi_tipsArr2,_loc13_]);
            }
            if(_loc4_ == 1)
            {
               if(!Fun.isVisible(GameInstance.uiInstance._banghuiInfoPanel))
               {
                  GameInstance.lookBanghuiID = _loc5_;
                  PipeManager.sendMsg(PipeConstants.SHOW_BANGHUI_INFO_PANEL);
               }
            }
            else
            {
               if(Fun.isVisible(GameInstance.uiInstance._banghuiInfoPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_BANGHUI_INFO_PANEL);
               }
               if(Fun.isVisible(GameInstance.uiInstance._banghuiMemberListPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_BANGHUI_MEMBER_LIST_PANEL);
               }
               if(Fun.isVisible(GameInstance.uiInstance._banghuiNewsPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_BANGHUI_NEWS_PANEL);
               }
               if(Fun.isVisible(GameInstance.uiInstance._bangqiInfoPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_BANGQI_INFO_PANEL);
               }
               if(Fun.isVisible(GameInstance.uiInstance._bangqiBanggongPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_BANGQI_BANGGONG_PANEL);
               }
            }
         }
         else
         {
            HeadFaceManager.updatePlayersName([_loc3_]);
            if(GameInstance.mainCharData.banghuiInfo.isTongbang(_loc5_))
            {
               if(Fun.isVisible(GameInstance.uiInstance._banghuiMemberListPanel))
               {
                  this.banghuiMemberListPanelMediator.f5();
               }
            }
         }
      }
      
      public function received_51072(param1:ByteArray) : void
      {
         ZLog.add("51072： 返回帮会见闻");
         var _loc2_:ByteArray = param1;
         var _loc3_:String = NetWorkManager.readGILMsg(_loc2_);
         this.banghuiNewsPanelMediator.receive_banghuiGonggao(_loc3_);
      }
      
      public function received_51080(param1:ByteArray) : void
      {
         ZLog.add("51080： 返回帮旗信息面板");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:String = _loc2_.readUTF();
         var _loc5_:int = _loc2_.readByte();
         var _loc6_:String = _loc2_.readUTF();
         var _loc7_:int = _loc2_.readInt();
         var _loc8_:int = _loc2_.readByte();
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         if(_loc8_ == 1)
         {
            _loc9_ = _loc2_.readInt();
            _loc10_ = _loc2_.readInt();
            _loc11_ = _loc2_.readInt();
            _loc12_ = _loc2_.readInt();
            _loc13_ = _loc2_.readInt();
            _loc14_ = _loc2_.readInt();
         }
         this.bangqiInfoPanelMediator.receive_bangqiInfo(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_);
      }
      
      public function received_51082(param1:ByteArray) : void
      {
         var _loc19_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:String = null;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:Number = NaN;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:int = 0;
         var _loc32_:int = 0;
         var _loc33_:int = 0;
         ZLog.add("51082： 返回帮贡记录列表");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readShort();
         var _loc4_:int = _loc2_.readShort();
         var _loc5_:int = _loc2_.readShort();
         var _loc6_:Number = _loc2_.readDouble();
         var _loc7_:int = _loc2_.readInt();
         var _loc8_:int = _loc2_.readInt();
         var _loc9_:int = _loc2_.readInt();
         var _loc10_:int = _loc2_.readInt();
         var _loc11_:int = _loc2_.readInt();
         var _loc12_:Number = _loc2_.readDouble();
         var _loc13_:int = _loc2_.readInt();
         var _loc14_:int = _loc2_.readInt();
         var _loc15_:int = _loc2_.readInt();
         var _loc16_:int = _loc2_.readInt();
         var _loc17_:int = _loc2_.readInt();
         var _loc18_:int = _loc2_.readInt();
         var _loc20_:Array = [];
         _loc19_ = 0;
         while(_loc19_ < _loc18_)
         {
            _loc22_ = _loc2_.readInt();
            _loc23_ = _loc2_.readUTF();
            _loc24_ = _loc2_.readShort();
            _loc25_ = _loc2_.readByte();
            _loc26_ = _loc2_.readByte();
            _loc27_ = _loc2_.readDouble();
            _loc28_ = _loc2_.readInt();
            _loc29_ = _loc2_.readInt();
            _loc30_ = _loc2_.readInt();
            _loc31_ = _loc2_.readInt();
            _loc32_ = _loc2_.readInt();
            _loc33_ = _loc2_.readInt();
            _loc20_.push([_loc22_,_loc23_,_loc24_,_loc25_,_loc26_,_loc27_,_loc28_,_loc29_,_loc30_,_loc31_,_loc32_,_loc33_]);
            _loc19_++;
         }
         var _loc21_:Number = _loc2_.readDouble();
         this.bangqiBanggongPanelMediator.receive_bangqiInfoBanggongjilu(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_,_loc15_,_loc16_,_loc17_,_loc20_,_loc21_);
      }
      
      public function received_51084(param1:ByteArray) : void
      {
         var _loc8_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:String = null;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:String = null;
         var _loc23_:int = 0;
         var _loc24_:String = null;
         var _loc25_:String = null;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         ZLog.add("51084： 返回所有地图的帮旗安插信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = _loc2_.readShort();
         var _loc5_:int = _loc2_.readShort();
         var _loc6_:int = _loc2_.readShort();
         var _loc7_:int = _loc2_.readInt();
         var _loc9_:Array = [];
         _loc8_ = 0;
         while(_loc8_ < _loc7_)
         {
            _loc15_ = _loc2_.readInt();
            _loc16_ = _loc2_.readInt();
            _loc17_ = _loc2_.readUTF();
            _loc18_ = _loc2_.readShort();
            _loc19_ = _loc2_.readShort();
            _loc20_ = _loc2_.readByte();
            _loc21_ = 0;
            _loc22_ = "";
            _loc23_ = 0;
            _loc24_ = "";
            _loc25_ = "";
            _loc26_ = 0;
            _loc27_ = 0;
            if(_loc20_ == 1)
            {
               _loc21_ = _loc2_.readByte();
               _loc22_ = _loc2_.readUTF();
               _loc23_ = _loc2_.readByte();
               _loc24_ = _loc2_.readUTF();
               _loc25_ = _loc2_.readUTF();
               _loc26_ = _loc2_.readInt();
               _loc27_ = _loc2_.readInt();
            }
            _loc9_.push([_loc15_,_loc16_,_loc17_,_loc18_,_loc19_,_loc20_,_loc21_,_loc22_,_loc23_,_loc24_,_loc25_,_loc26_,_loc27_]);
            _loc8_++;
         }
         var _loc10_:int = _loc2_.readInt();
         var _loc11_:String = _loc2_.readUTF();
         var _loc12_:int = _loc2_.readInt();
         var _loc13_:String = _loc2_.readUTF();
         var _loc14_:int = _loc2_.readInt();
         this.bangqiInfoPanelMediator.receive_bangqiAnchaList(_loc3_,_loc4_,_loc5_,_loc6_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_);
      }
      
      public function received_51092(param1:ByteArray) : void
      {
         var _loc4_:String = null;
         ZLog.add("51092： 返回贡献铜钱响应");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         if(_loc3_ == 1)
         {
            sendNotification(Banghui_ApplicationFacade.BANGQI_CHANGED);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"贡献铜钱成功"));
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"贡献铜钱成功"));
         }
         else
         {
            _loc4_ = _loc2_.readUTF();
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc4_);
            NoticeManager.notify(NoticeManager.FOOT,_loc4_);
         }
      }
      
      public function received_51094(param1:ByteArray) : void
      {
         var _loc4_:String = null;
         ZLog.add("51094： 返回贡献令牌响应");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         if(_loc3_ == 1)
         {
            sendNotification(Banghui_ApplicationFacade.BANGQI_CHANGED);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"贡献令牌成功"));
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"贡献令牌成功"));
         }
         else
         {
            _loc4_ = _loc2_.readUTF();
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc4_);
            NoticeManager.notify(NoticeManager.FOOT,_loc4_);
         }
      }
      
      public function received_51096(param1:ByteArray) : void
      {
         var _loc4_:String = null;
         ZLog.add("51096： 返回安插帮旗响应");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         if(_loc3_ == 1)
         {
            sendNotification(Banghui_ApplicationFacade.BANGQI_CHANGED);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"帮旗安插成功"));
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"帮旗安插成功"));
         }
         else
         {
            _loc4_ = _loc2_.readUTF();
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc4_);
            NoticeManager.notify(NoticeManager.FOOT,_loc4_);
         }
      }
      
      public function received_51098(param1:ByteArray) : void
      {
         var _loc4_:String = null;
         ZLog.add("51098： 返回恢复帮旗血量响应");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         if(_loc3_ == 1)
         {
            sendNotification(Banghui_ApplicationFacade.BANGQI_CHANGED);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"帮旗血量恢复成功"));
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"帮旗血量恢复成功"));
         }
         else
         {
            _loc4_ = _loc2_.readUTF();
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc4_);
            NoticeManager.notify(NoticeManager.FOOT,_loc4_);
         }
      }
      
      public function received_51100(param1:ByteArray) : void
      {
         var _buf:ByteArray;
         var banghuiInfo:BanghuiInfo;
         var $data:ByteArray = param1;
         ZLog.add("51100： 返回帮主改变帮旗（等级，名字, 样式）");
         _buf = $data;
         banghuiInfo = GameInstance.mainCharData.banghuiInfo;
         banghuiInfo.bangqiLv = _buf.readByte();
         banghuiInfo.bangqiName = _buf.readUTF();
         banghuiInfo.bangqiImgID = _buf.readByte();
         banghuiInfo.bangqiImgColor = _buf.readUTF().split(",").map(function(param1:*, param2:int, param3:Array):int
         {
            return int(Number(param1));
         });
         sendNotification(Banghui_ApplicationFacade.BANGQI_CHANGED);
      }
      
      public function received_51102(param1:ByteArray) : void
      {
         ZLog.add("51102： 返回帮旗血量变化");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:Number = _loc2_.readDouble();
         var _loc5_:Number = _loc2_.readDouble();
         var _loc6_:SceneCharacter = GameInstance.scene.getCharByID(_loc3_,SceneCharacterType.MONSTER);
         if(!_loc6_)
         {
            return;
         }
         (_loc6_.data as Monster).attributeInfo.hpNow = _loc4_;
         (_loc6_.data as Monster).attributeInfo.hpMax = _loc5_;
         _loc6_.setHeadFaceBar(_loc4_,_loc5_);
         if(GameInstance.lockOnChar == _loc6_)
         {
            PipeManager.sendMsg(PipeConstants.CHANGED_LOCKEDCHAR_BASE_ATTR,GameInstance.lockOnChar);
         }
      }
      
      public function received_51104(param1:ByteArray) : void
      {
         var _loc8_:int = 0;
         var _loc10_:int = 0;
         ZLog.add("51104：返回襄阳归属面板");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:String = _loc2_.readUTF();
         var _loc5_:String = _loc2_.readUTF();
         var _loc6_:Object = {};
         var _loc7_:int = _loc2_.readByte();
         _loc8_ = 0;
         while(_loc8_ < _loc7_)
         {
            _loc10_ = _loc2_.readByte();
            _loc6_["id" + _loc10_] = _loc2_.readInt();
            _loc6_["name" + _loc10_] = _loc2_.readUTF();
            _loc8_++;
         }
         var _loc9_:int = _loc2_.readByte();
         this.gongchengXiangyangguishuPanelMediator.receive_xiangyangguishu(_loc3_,_loc4_,_loc5_,_loc6_,_loc9_);
      }
      
      public function received_51144(param1:ByteArray) : void
      {
         var _loc4_:String = null;
         ZLog.add("51144：返回领取专属奖励（紫松果）结果");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         if(_loc3_ == 1)
         {
            this.gongchengXiangyangguishuPanelMediator.f5();
         }
         else
         {
            _loc4_ = NetWorkManager.readGILMsg(_loc2_);
            NoticeManager.notify(NoticeManager.FOOT,_loc4_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc4_);
         }
      }
      
      public function received_51146(param1:ByteArray) : void
      {
         var _loc4_:String = null;
         ZLog.add("51146： 返回修改城主公告相应S-B");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         if(_loc3_ == 1)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"城主公告修改成功"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"城主公告修改成功"),false);
         }
         else
         {
            _loc4_ = _loc2_.readUTF();
            NoticeManager.notify(NoticeManager.FOOT,_loc4_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc4_);
         }
      }
      
      public function received_51106(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc11_:Array = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:Date = null;
         var _loc15_:int = 0;
         var _loc16_:String = null;
         ZLog.add("51106：返回攻城日程查询");
         var _loc2_:ByteArray = param1;
         var _loc3_:Array = [];
         var _loc4_:int = _loc2_.readByte();
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = _loc2_.readDouble();
            _loc7_ = _loc2_.readDouble();
            _loc8_ = _loc2_.readByte();
            _loc9_ = 0;
            _loc10_ = "";
            if(_loc8_ == 1)
            {
               _loc9_ = _loc2_.readInt();
               _loc10_ = _loc2_.readUTF();
            }
            _loc11_ = [];
            _loc12_ = _loc2_.readShort();
            _loc13_ = 0;
            while(_loc13_ < _loc12_)
            {
               _loc15_ = _loc2_.readInt();
               _loc16_ = _loc2_.readUTF();
               _loc11_.push(_loc16_);
               _loc13_++;
            }
            _loc14_ = new Date();
            _loc14_.setTime(_loc6_);
            _loc3_.push([_loc14_,_loc10_,_loc11_]);
            _loc5_++;
         }
         if(_loc4_ == 0)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"目前没有攻城信息"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"目前没有攻城信息"),false);
         }
         GameInstance.uiInstance.gongchengXiangyangguishuSPanel.showTodoPanel(_loc3_);
      }
      
      public function received_51148(param1:ByteArray) : void
      {
         ZLog.add("51148：返回当前申请什么时候可以开战");
         var _loc2_:Number = param1.readDouble();
         var _loc3_:Date = new Date();
         _loc3_.setTime(_loc2_);
         GameInstance.uiInstance.gongchengXiangyangguishuSPanel.showSumbitPanel(_loc3_);
      }
      
      public function received_51108(param1:ByteArray) : void
      {
         ZLog.add("51108：返回提交攻城申请成功");
         NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"攻城申请提交成功"),false);
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"攻城申请提交成功"),false);
      }
      
      public function received_51110(param1:ByteArray) : void
      {
         ZLog.add("51110：返回税率与税收面板");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:Number = _loc2_.readDouble();
         var _loc5_:Number = _loc2_.readDouble();
         var _loc6_:int = _loc2_.readByte();
         var _loc7_:int = _loc2_.readByte();
         var _loc8_:int = _loc2_.readByte();
         GameInstance.uiInstance.gongchengXiangyangguishuSPanel.setRevenueValue(_loc3_ / 10000 * 100,_loc4_,_loc5_,_loc6_,_loc8_,_loc7_);
      }
      
      public function received_51112(param1:ByteArray) : void
      {
         ZLog.add("51112：返回修改税率成功");
         NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"修改税率成功"),false);
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"修改税率成功"),false);
      }
      
      public function received_51114(param1:ByteArray) : void
      {
         ZLog.add("51114：返回领取税收成功");
         NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"领取税收成功"),false);
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"领取税收成功"),false);
      }
      
      public function received_51116(param1:ByteArray) : void
      {
         ZLog.add("51116：返回火炮军团界面");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:int = _loc2_.readInt();
         var _loc6_:int = _loc2_.readShort();
         var _loc7_:int = _loc2_.readShort();
         var _loc8_:int = _loc2_.readInt();
         var _loc9_:int = _loc2_.readInt();
         this.gongchengGongchengchePanelMediator.receive_gongchengche(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
      }
      
      public function received_51118(param1:ByteArray) : void
      {
         ZLog.add("51118：返回购买炮弹成功");
         NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"购买炮弹成功"),false);
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"购买炮弹成功"),false);
         this.gongchengGongchengchePanelMediator.f5();
      }
      
      public function received_51120(param1:ByteArray) : void
      {
         ZLog.add("51120：返回发炮延时");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         SmallLoadingBar.showLoading(LanResManager.getLanTextWords(this,"炮弹发射中"),_loc3_ * 1000);
      }
      
      public function received_51122(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:String = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:String = null;
         var _loc12_:int = 0;
         var _loc13_:String = null;
         var _loc14_:String = null;
         var _loc15_:String = null;
         var _loc16_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         if(_loc3_ == 1)
         {
            ZLog.add("51122：返回发炮成功");
            _loc4_ = _loc2_.readInt();
            _loc5_ = _loc2_.readShort();
            _loc6_ = _loc2_.readShort();
            _loc7_ = _loc2_.readShort();
            _loc8_ = "";
            _loc9_ = _loc2_.readShort();
            if(_loc9_ > 0)
            {
               _loc10_ = 0;
               while(_loc10_ < _loc9_)
               {
                  _loc14_ = _loc2_.readUTF();
                  if(_loc8_ != "")
                  {
                     _loc8_ += ",[" + _loc14_ + "]";
                  }
                  else
                  {
                     _loc8_ += "[" + _loc14_ + "]";
                  }
                  _loc10_++;
               }
            }
            else
            {
               _loc8_ = LanResManager.getLanCommonTextWords("无");
            }
            _loc11_ = "";
            _loc12_ = _loc2_.readShort();
            if(_loc12_ > 0)
            {
               _loc10_ = 0;
               while(_loc10_ < _loc12_)
               {
                  _loc15_ = _loc2_.readUTF();
                  if(_loc11_ != "")
                  {
                     _loc11_ += ",[" + _loc15_ + "]";
                  }
                  else
                  {
                     _loc11_ += "[" + _loc15_ + "]";
                  }
                  _loc10_++;
               }
            }
            else
            {
               _loc11_ = LanResManager.getLanCommonTextWords("无");
            }
            _loc13_ = LanResManager.getLanTextWords(this,"炮弹成功发射",[_loc5_,_loc6_,_loc8_,_loc11_]);
            NoticeManager.notify(NoticeManager.FOOT,_loc13_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc13_);
            this.gongchengGongchengchePanelMediator.receive_paodanBaozha(_loc4_,_loc5_,_loc6_,_loc7_);
            this.gongchengGongchengchePanelMediator.f5();
         }
         else
         {
            _loc16_ = NetWorkManager.readGILMsg(_loc2_);
            ZLog.add("51122：返回发炮失败" + _loc2_);
            NoticeManager.notify(NoticeManager.FOOT,_loc16_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc16_);
         }
         SmallLoadingBar.close();
      }
      
      public function received_51124(param1:ByteArray) : void
      {
         ZLog.add("51124：返回拔剑倒计时");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         SmallLoadingBar.showLoading(LanResManager.getLanTextWords(this,"拔剑中"),_loc3_ * 1000);
      }
      
      public function received_51126(param1:ByteArray) : void
      {
         var _loc4_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         if(_loc3_ == 1)
         {
            ZLog.add("51126：返回拔剑成功");
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"拔剑成功"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"拔剑成功"),false);
         }
         else
         {
            _loc4_ = NetWorkManager.readGILMsg(_loc2_);
            ZLog.add("51126：返回拔剑失败" + _loc2_);
            NoticeManager.notify(NoticeManager.FOOT,_loc4_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc4_);
         }
         SmallLoadingBar.close();
      }
      
      public function received_51128(param1:ByteArray) : void
      {
         ZLog.add("51128：攻城实时信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:Boolean = _loc2_.readByte() == 1;
         var _loc4_:Object = {};
         if(_loc3_)
         {
            _loc4_.youlongzhirenX = _loc2_.readShort();
            _loc4_.youlongzhirenY = _loc2_.readShort();
            _loc4_.chiyouBangzhu = _loc2_.readUTF();
            _loc4_.chiyouShijian = _loc2_.readByte();
            _loc4_.chiyouBanghui = _loc2_.readUTF();
            _loc4_.tingliuShijian = _loc2_.readByte();
            _loc4_.shengyuJieshuShijian = _loc2_.readByte();
         }
         else
         {
            _loc4_.youlongzhirenX = _loc2_.readShort();
            _loc4_.youlongzhirenY = _loc2_.readShort();
            _loc4_.jianTingliuShijian = _loc2_.readByte();
            _loc4_.tingliuShijian = _loc2_.readByte();
            _loc4_.shengyuJieshuShijian = _loc2_.readByte();
         }
         this.gongchengTimePanelMediator.receive_time(_loc4_);
      }
      
      public function received_51140(param1:ByteArray) : void
      {
         var _loc4_:SceneCharacter = null;
         ZLog.add("51140：襄阳城城主(或帮会)变化");
         var _loc2_:ByteArray = param1;
         GameConfig.xiangyangcheng_banghuiID = _loc2_.readInt();
         GameConfig.xiangyangcheng_bangzhuID = _loc2_.readInt();
         var _loc3_:Array = [];
         for each(_loc4_ in GameInstance.scene.sceneCharacters)
         {
            if(_loc4_.type == SceneCharacterType.PLAYER)
            {
               _loc3_.push(_loc4_.id);
            }
         }
         HeadFaceManager.updatePlayersName(_loc3_);
      }
      
      public function received_51142(param1:ByteArray) : void
      {
         ZLog.add("51142：襄阳城税率变化");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         GameConfig.xiangyangcheng_shuilv = _loc3_ / 10000;
      }
      
      public function received_51130(param1:ByteArray) : void
      {
         var _loc5_:SceneCharacter = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         ZLog.add("51130：攻城状态");
         var _loc2_:ByteArray = param1;
         ReloginManager.isInGongcheng = _loc2_.readByte() == 1;
         var _loc3_:Array = [];
         if(ReloginManager.isInGongcheng)
         {
            _loc6_ = _loc2_.readShort();
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc3_.push(_loc2_.readInt());
               _loc7_++;
            }
         }
         GameConfig.gongcheng_banghuiID_arr = _loc3_;
         var _loc4_:Array = [];
         for each(_loc5_ in GameInstance.scene.sceneCharacters)
         {
            if(_loc5_.type == SceneCharacterType.PLAYER)
            {
               _loc4_.push(_loc5_.id);
            }
         }
         HeadFaceManager.updatePlayersName(_loc4_);
      }
      
      public function received_51134(param1:ByteArray) : void
      {
         ZLog.add("51134：通知客户端切线的新线路ID");
         var _loc2_:ByteArray = param1;
         GameConfig.lineID = _loc2_.readByte();
         GameConfig.lineName = _loc2_.readUTF();
         GameInstance.uiInstance.mainUI.setLineName(GameConfig.lineName);
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("您已切线至：") + GameConfig.lineName,false);
      }
      
      public function received_71022(param1:ByteArray) : void
      {
         var _loc6_:Object = null;
         ZLog.add("71022：返回其他帮派荣誉城池列表信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = new Object();
            _loc6_.biaoshi = _loc2_.readByte();
            _loc6_.name = _loc2_.readUTF();
            _loc6_.jieceng = _loc2_.readByte();
            _loc6_.qingkuang = _loc2_.readByte();
            _loc6_.dengji = _loc2_.readInt();
            _loc4_.push(_loc6_);
            _loc5_++;
         }
         this.banghuiInfoPanelMediator.bangpailist(_loc4_);
      }
      
      public function received_51218(param1:ByteArray) : void
      {
         ZLog.add("51218：返回越南 兑换帮派扩展符结果");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = param1.readByte();
         if(_loc3_ == 1)
         {
            this.bangqiBanggongPanelMediator.requestPanel();
         }
      }
   }
}

