package com.tgame.moudels.zhanWenKeHua.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.GoodsKind;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.staticdata.SynthesizeMsg;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.zhanWenKeHua.ZhanWenKeHua_ApplicationFacade;
   import com.tgame.moudels.zhanWenKeHua.model.ZhanWenKeHua_MsgSendProxy;
   import com.tgame.shell.view.components.EquipPuddingTwoPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ZhanWenKeHua_Mediator extends Mediator
   {
      
      public static const NAME:String = "ZhanWenKeHua_Mediator";
      
      private var equip:Goods;
      
      private var xingYunJingNum:int = 0;
      
      private var gaiLv:int = 0;
      
      private var zhenQi:int = 0;
      
      private var itemres:int = 0;
      
      private var panelType:String = "";
      
      private var isUseYuZao:Boolean;
      
      private var loaderBuff:LoadBuffer;
      
      private var copper:int = 0;
      
      private var xuanPinShiNum:int = 0;
      
      private var zhenHunFuNum:int = 0;
      
      private var jingLianShi:Goods;
      
      private var xingYunJing:Goods;
      
      private var zhenHunFu:Goods;
      
      private var isShowTip:Boolean = false;
      
      private var _sendMsg:ZhanWenKeHua_MsgSendProxy;
      
      public function ZhanWenKeHua_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get panel() : EquipPuddingTwoPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.equipPuddingTwoPanel);
         }
         return viewComponent as EquipPuddingTwoPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [ZhanWenKeHua_ApplicationFacade.NEW_ITEM_TO_BACKPACK,ZhanWenKeHua_ApplicationFacade.ITEM_SWAP_OR_MOVE,ZhanWenKeHua_ApplicationFacade.CLOSE_ZHAN_WEN_KE_HUA_LOAD_BUFF,ZhanWenKeHua_ApplicationFacade.EXPENDGAS_AND_PROBABILITY,ZhanWenKeHua_ApplicationFacade.SYNTHESIZE_NOT_ITEM,ZhanWenKeHua_ApplicationFacade.SHOW_ZHAN_WEN_KE_HUA_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Boolean = false;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Goods = null;
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case ZhanWenKeHua_ApplicationFacade.SHOW_ZHAN_WEN_KE_HUA_PANEL:
               _loc6_ = _loc2_ as int;
               if(_loc6_ == 1)
               {
                  this.panelClose();
                  this.panelType = EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_SHOW;
                  this.panel.showModifyCountCanvas(true);
                  this.panel.setModifyCountExpendGasAndProbability(0,"",0);
                  this.panel.setModifyCountEnergyExpendItem(true,new Goods(SpecialGoodsID.XUANJINGSHI),new Goods(SpecialGoodsID.XINGYUNJING_ID));
               }
               if(_loc6_ == 2)
               {
                  this.panelClose();
                  this.panelType = EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_SHOW;
                  this.panel.showModifyValueCanvas(true);
                  this.panel.setModifyValueExpendGasAndProbability(0,"",0);
                  this.panel.setModifyValueEnergyExpendItem(true,new Goods(SpecialGoodsID.XUANJINGSHI),new Goods(SpecialGoodsID.XINGYUNJING_ID));
               }
               if(_loc6_ == 3)
               {
                  this.panelClose();
                  this.panelType = EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_SHOW;
                  this.panel.showZanWenCanvas(true);
                  this.panel.setZanWenExpendGasAndProbability(0,"",0);
                  this.panel.setZanWenEnergyExpendItem(true,new Goods(SpecialGoodsID.ZHAN_WEN),new Goods(SpecialGoodsID.ZHENHUNFU_ID));
               }
               break;
            case ZhanWenKeHua_ApplicationFacade.EXPENDGAS_AND_PROBABILITY:
               if(_loc2_.type == 12 && this.panelType == EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_SHOW)
               {
                  this.panel.setModifyCountEquip(this.equip);
                  this.gaiLv = _loc2_.gaiLv;
                  this.zhenQi = _loc2_.zhenQi;
                  this.copper = _loc2_.copper;
                  this.xuanPinShiNum = _loc2_.useItemNum;
                  _loc5_ = this.gaiLv + this.xingYunJingNum * OtherConst.XINGYUNJING_JILV < 100 ? int(this.gaiLv + this.xingYunJingNum * OtherConst.XINGYUNJING_JILV) : 100;
                  this.jingLianShi = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XUANJINGSHI,true);
                  this.xingYunJing = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XINGYUNJING_ID,true);
                  _loc3_ = this.jingLianShi.count > 0 ? false : true;
                  this.panel.setModifyCountEnergyExpendItem(_loc3_,this.jingLianShi,this.xingYunJing);
                  if(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XUANJINGSHI,true).count >= this.xuanPinShiNum)
                  {
                     _loc4_ = LanResManager.getLanTextWords(this,"玄晶石数量",[StaticValue.GREEN_HTML,this.xuanPinShiNum]);
                  }
                  else
                  {
                     _loc4_ = LanResManager.getLanTextWords(this,"玄晶石数量",[StaticValue.RED_HTML,this.xuanPinShiNum]);
                  }
                  this.panel.setModifyCountExpendGasAndProbability(this.copper,_loc4_,_loc5_);
               }
               if(_loc2_.type == 13 && this.panelType == EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_SHOW)
               {
                  this.panel.setModifyValueEquip(this.equip);
                  this.gaiLv = _loc2_.gaiLv;
                  this.zhenQi = _loc2_.zhenQi;
                  this.copper = _loc2_.copper;
                  this.xuanPinShiNum = _loc2_.useItemNum;
                  _loc5_ = this.gaiLv + this.xingYunJingNum * OtherConst.XINGYUNJING_JILV < 100 ? int(this.gaiLv + this.xingYunJingNum * OtherConst.XINGYUNJING_JILV) : 100;
                  this.jingLianShi = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XUANJINGSHI,true);
                  this.xingYunJing = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XINGYUNJING_ID,true);
                  _loc3_ = this.jingLianShi.count > 0 ? false : true;
                  this.panel.setModifyValueEnergyExpendItem(_loc3_,this.jingLianShi,this.xingYunJing);
                  if(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XUANJINGSHI,true).count >= this.xuanPinShiNum)
                  {
                     _loc4_ = LanResManager.getLanTextWords(this,"玄晶石数量",[StaticValue.GREEN_HTML,this.xuanPinShiNum]);
                  }
                  else
                  {
                     _loc4_ = LanResManager.getLanTextWords(this,"玄晶石数量",[StaticValue.GREEN_HTML,this.xuanPinShiNum]);
                  }
                  if(GameState.gongneng114)
                  {
                     if(this.equip.quality >= 4 && this.xingYunJingNum >= 5)
                     {
                        this.panel.setModifyValueExpendGasAndProbability(this.copper,_loc4_,100);
                     }
                     else
                     {
                        this.panel.setModifyValueExpendGasAndProbability(this.copper,_loc4_,_loc5_);
                     }
                  }
                  else
                  {
                     this.panel.setModifyValueExpendGasAndProbability(this.copper,_loc4_,_loc5_);
                  }
               }
               if(_loc2_.type == 14 && this.panelType == EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_SHOW)
               {
                  this.panel.setZanWenEquip(this.equip);
                  this.gaiLv = _loc2_.gaiLv;
                  this.zhenQi = _loc2_.zhenQi;
                  this.copper = _loc2_.copper;
                  this.xuanPinShiNum = _loc2_.useItemNum;
                  this.jingLianShi = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.ZHAN_WEN,true);
                  this.zhenHunFu = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.ZHENHUNFU_ID,true);
                  _loc3_ = this.jingLianShi.count > 0 ? false : true;
                  this.panel.setZanWenEnergyExpendItem(_loc3_,this.jingLianShi,this.zhenHunFu);
                  if(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.ZHAN_WEN,true).count >= this.xuanPinShiNum)
                  {
                     _loc4_ = LanResManager.getLanTextWords(this,"图腾战纹",[StaticValue.GREEN_HTML,this.xuanPinShiNum]);
                  }
                  else
                  {
                     _loc4_ = LanResManager.getLanTextWords(this,"图腾战纹",[StaticValue.RED_HTML,this.xuanPinShiNum]);
                  }
                  this.panel.setZanWenExpendGasAndProbability(this.copper,_loc4_,this.gaiLv);
               }
               break;
            case ZhanWenKeHua_ApplicationFacade.CLOSE_ZHAN_WEN_KE_HUA_LOAD_BUFF:
               this.removeLoaderBuff();
               break;
            case ZhanWenKeHua_ApplicationFacade.NEW_ITEM_TO_BACKPACK:
               if(!Fun.isVisible(this.panel) || !this.equip)
               {
                  return;
               }
               _loc7_ = _loc2_ as Goods;
               if(_loc7_.id == SpecialGoodsID.XINGYUNJING_ID)
               {
                  this.xingYunJing = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XINGYUNJING_ID,true);
                  if(this.panelType == EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_SHOW)
                  {
                     this.jingLianShi = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XUANJINGSHI,true);
                     this.xingYunJing = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XINGYUNJING_ID,true);
                     _loc3_ = this.jingLianShi.count > 0 ? false : true;
                     this.panel.setModifyCountEnergyExpendItem(_loc3_,this.jingLianShi,this.xingYunJing);
                  }
                  if(this.panelType == EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_SHOW)
                  {
                     this.jingLianShi = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XUANJINGSHI,true);
                     this.xingYunJing = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XINGYUNJING_ID,true);
                     _loc3_ = this.jingLianShi.count > 0 ? false : true;
                     this.panel.setModifyValueEnergyExpendItem(_loc3_,this.jingLianShi,this.xingYunJing);
                  }
               }
               if(_loc7_.id == SpecialGoodsID.ZHENHUNFU_ID)
               {
                  if(this.panelType == EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_SHOW)
                  {
                     if(!this.equip)
                     {
                        return;
                     }
                     this.jingLianShi = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.ZHAN_WEN,true);
                     this.zhenHunFu = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.ZHENHUNFU_ID,true);
                     _loc3_ = this.jingLianShi.count > 0 ? false : true;
                     this.panel.setZanWenEnergyExpendItem(_loc3_,this.jingLianShi,this.zhenHunFu);
                  }
               }
               break;
            case ZhanWenKeHua_ApplicationFacade.ITEM_SWAP_OR_MOVE:
               _loc8_ = _loc2_ as Array;
               _loc9_ = 0;
               while(_loc9_ < _loc8_.length)
               {
                  if(this.equip)
                  {
                     if(_loc8_[_loc9_] == this.equip.position)
                     {
                        if(Fun.isVisible(this.panel))
                        {
                           PipeManager.sendMsg(PipeConstants.SHOW_STONE_PLANE);
                        }
                        this.panelClose(null,true);
                        return;
                     }
                  }
                  _loc9_++;
               }
               break;
            case ZhanWenKeHua_ApplicationFacade.SYNTHESIZE_NOT_ITEM:
               if(_loc2_.type == 12 || _loc2_.type == 13 || _loc2_.type == 14)
               {
                  this.replay();
               }
         }
      }
      
      public function isTiHuanZhanWen(param1:int, param2:String, param3:String) : void
      {
         var zhanWenTiHuanIndex:int = param1;
         var oldstr:String = param2;
         var newstr:String = param3;
         var next:Function = function(param1:FAlertEvent = null):void
         {
            if(param1.eventData == FAlert.OK)
            {
               sendMsg.send_50189({
                  "index":zhanWenTiHuanIndex,
                  "isTiHuan":1
               });
            }
            else
            {
               sendMsg.send_50189({
                  "index":zhanWenTiHuanIndex,
                  "isTiHuan":0
               });
               removeLoaderBuff();
            }
         };
         var arr:Array = [LanResManager.getLanCommonTextWords("攻击力增强"),LanResManager.getLanCommonTextWords("反弹伤害"),LanResManager.getLanCommonTextWords("忽视防御"),LanResManager.getLanCommonTextWords("伤害减免"),LanResManager.getLanCommonTextWords("暗器免伤"),LanResManager.getLanCommonTextWords("暗器几率")];
         var r:Array = oldstr.split(",");
         oldstr = arr[int(r[1]) - 20] + " +" + r[2] + "%";
         r = newstr.split(",");
         newstr = arr[int(r[1]) - 20] + " +" + r[2] + "%";
         FAlert.show(LanResManager.getLanTextWords(this,"新属性生成战纹旧属性",[oldstr,newstr]),"",2,next);
      }
      
      public function upDataItem(param1:String, param2:int, param3:* = null) : void
      {
         if(param2 == 0)
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_EQUIP_STRONG_FA);
         }
         if(param2 == 1)
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_HECHENG_SU);
         }
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         this.removeLoaderBuff();
         if(!Fun.isVisible(GameInstance.uiInstance._equipPuddingTwoPanel))
         {
            this.panelClose();
            return;
         }
         if(param1 == this.panelType && this.panelType == EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_SHOW && Boolean(this.equip))
         {
            this.equip = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(this.equip.position);
            this.panel.setModifyCountEquip(this.equip);
            this.itemToPanel(null,this.equip);
         }
         if(param1 == this.panelType && this.panelType == EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_SHOW && Boolean(this.equip))
         {
            this.equip = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(this.equip.position);
            this.panel.setModifyValueEquip(this.equip);
            this.itemToPanel(null,this.equip);
         }
         if(param1 == this.panelType && this.panelType == EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_SHOW && Boolean(this.equip))
         {
            if(param2 != 2)
            {
               this.equip = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(this.equip.position);
               this.panel.setZanWenEquip(this.equip);
               this.itemToPanel(null,this.equip);
            }
            else
            {
               this.panel.getZanWenEquip();
            }
         }
      }
      
      public function addLoadBuffer() : void
      {
         this.removeLoaderBuff();
         this.loaderBuff = LoadBuffer.show(GameInstance.uiInstance.equipPuddingTwoPanel);
      }
      
      public function removeLoaderBuff() : void
      {
         if(this.loaderBuff)
         {
            this.loaderBuff.close();
         }
         this.loaderBuff = null;
      }
      
      public function isResetStrengthenLevel(param1:int, param2:String, param3:String) : void
      {
         this.panelNewOrOldSelectListener(true);
         if(param1 == 50168)
         {
            this.panel.showCountConfirmPanel(param2,param3);
         }
         if(param1 == 50178)
         {
            this.panel.showValueConfirmPanel(param2,param3);
         }
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(EquipPuddingTwoPanel,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,mainCharEquipPuddingHandle);
            panel.addEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_SHOW,mainCharEquipPuddingHandle);
            panel.addEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_SHOW,mainCharEquipPuddingHandle);
            panel.addEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_SHOW,mainCharEquipPuddingHandle);
            panel.addEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_CLICK,mainCharEquipPuddingHandle);
            panel.addEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_GETEQUIPBTN_CLICK,mainCharEquipPuddingHandle);
            panel.addEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_SETEQUIPBTN_CLICK,mainCharEquipPuddingHandle);
            panel.addEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_USELUCKSTONE,mainCharEquipPuddingHandle);
            panel.addEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_GETEQUIPBTN_CLICK,mainCharEquipPuddingHandle);
            panel.addEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_SETEQUIPBTN_CLICK,mainCharEquipPuddingHandle);
            panel.addEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_STARTBTN_CLICK,mainCharEquipPuddingHandle);
            panel.addEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_USELUCKSTONE,mainCharEquipPuddingHandle);
            panel.addEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_GETEQUIPBTN_CLICK,mainCharEquipPuddingHandle);
            panel.addEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_SETEQUIPBTN_CLICK,mainCharEquipPuddingHandle);
            panel.addEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_STARTBTN_CLICK,mainCharEquipPuddingHandle);
            panel.addEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_USELUCKSTONE,mainCharEquipPuddingHandle);
            panel.addEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_TIPCANVAS_OPTION,mainCharEquipPuddingHandle);
            panel.addEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_TIPCANVAS_NEXT_IS_SHOW,mainCharEquipPuddingHandle);
            panel.addEventListener(FCloseEvent.CLOSE,panelClose);
            panel.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(EquipPuddingTwoPanel,function():void
         {
            panel.removeEventListener(Event.ADDED_TO_STAGE,mainCharEquipPuddingHandle);
            panel.removeEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_SHOW,mainCharEquipPuddingHandle);
            panel.removeEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_SHOW,mainCharEquipPuddingHandle);
            panel.removeEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_SHOW,mainCharEquipPuddingHandle);
            panel.removeEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_CLICK,mainCharEquipPuddingHandle);
            panel.removeEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_GETEQUIPBTN_CLICK,mainCharEquipPuddingHandle);
            panel.removeEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_SETEQUIPBTN_CLICK,mainCharEquipPuddingHandle);
            panel.removeEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_USELUCKSTONE,mainCharEquipPuddingHandle);
            panel.removeEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_GETEQUIPBTN_CLICK,mainCharEquipPuddingHandle);
            panel.removeEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_SETEQUIPBTN_CLICK,mainCharEquipPuddingHandle);
            panel.removeEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_STARTBTN_CLICK,mainCharEquipPuddingHandle);
            panel.removeEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_USELUCKSTONE,mainCharEquipPuddingHandle);
            panel.removeEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_GETEQUIPBTN_CLICK,mainCharEquipPuddingHandle);
            panel.removeEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_TIPCANVAS_OPTION,mainCharEquipPuddingHandle);
            panel.removeEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_TIPCANVAS_NEXT_IS_SHOW,mainCharEquipPuddingHandle);
            panel.removeEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_SETEQUIPBTN_CLICK,mainCharEquipPuddingHandle);
            panel.removeEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_STARTBTN_CLICK,mainCharEquipPuddingHandle);
            panel.removeEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_USELUCKSTONE,mainCharEquipPuddingHandle);
            panel.removeEventListener(FCloseEvent.CLOSE,panelClose);
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
      }
      
      private function panelClose(param1:* = null, param2:Boolean = false) : void
      {
         if(Boolean(this.loaderBuff) && !param2)
         {
            return;
         }
         this.replay();
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         this.resumMouseStatus();
         this.panelType = "";
         if(param2)
         {
            this.removeLoaderBuff();
         }
      }
      
      private function panelNewOrOldSelectListener(param1:Boolean) : void
      {
         if(param1)
         {
            this.panel.addEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_CONFIRM_USE_NEW,this.mainCharEquipPuddingHandle);
            this.panel.addEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_CONFIRM_USE_OLD,this.mainCharEquipPuddingHandle);
            this.panel.addEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_CONFIRM_USE_NEW,this.mainCharEquipPuddingHandle);
            this.panel.addEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_CONFIRM_USE_OLD,this.mainCharEquipPuddingHandle);
         }
         else
         {
            this.panel.removeEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_CONFIRM_USE_NEW,this.mainCharEquipPuddingHandle);
            this.panel.removeEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_CONFIRM_USE_OLD,this.mainCharEquipPuddingHandle);
            this.panel.removeEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_CONFIRM_USE_NEW,this.mainCharEquipPuddingHandle);
            this.panel.removeEventListener(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_CONFIRM_USE_OLD,this.mainCharEquipPuddingHandle);
         }
      }
      
      private function mainCharEquipPuddingHandle(param1:Event = null) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc4_:int = 0;
         var _loc5_:Goods = null;
         var _loc6_:Goods = null;
         var _loc7_:String = null;
         var _loc8_:Boolean = false;
         _loc2_ = param1 as BaseEvent;
         var _loc3_:Object = {};
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               if(!Fun.isVisible(GameInstance.uiInstance._backpack))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
               }
               ResizeManager.showDoublePanel(this.panel,GameInstance.uiInstance.backpack);
            case EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_SHOW:
               this.panelClose();
               this.panelType = EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_SHOW;
               this.panel.showModifyCountCanvas();
               this.panel.setModifyCountExpendGasAndProbability(0,"",0);
               this.panel.setModifyCountEnergyExpendItem(true,new Goods(SpecialGoodsID.XUANJINGSHI),new Goods(SpecialGoodsID.XINGYUNJING_ID));
               break;
            case EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_SHOW:
               this.panelClose();
               this.panelType = EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_SHOW;
               this.panel.showModifyValueCanvas();
               this.panel.setModifyValueExpendGasAndProbability(0,"",0);
               this.panel.setModifyValueEnergyExpendItem(true,new Goods(SpecialGoodsID.XUANJINGSHI),new Goods(SpecialGoodsID.XINGYUNJING_ID));
               this.panel.isShowExchangeLabel(GameState.gongneng114);
               break;
            case EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_SHOW:
               this.panelClose();
               this.panelType = EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_SHOW;
               this.panel.showZanWenCanvas();
               this.panel.setZanWenExpendGasAndProbability(0,"",0);
               this.panel.setZanWenEnergyExpendItem(true,new Goods(SpecialGoodsID.ZHAN_WEN),new Goods(SpecialGoodsID.ZHENHUNFU_ID));
               if(GameInstance.mainCharData.buffInfo.hasBuff(1606))
               {
                  this.panel.setBuff([GameInstance.mainCharData.buffInfo.getBuff(1606)]);
               }
               else
               {
                  this.panel.setBuff([]);
               }
               break;
            case EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_SETEQUIPBTN_CLICK:
               this.itemres = GoodsKind.K2;
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               this.panel.getModifyCountEquip();
               this.openBackpack();
               this.changeMouseStatus();
               break;
            case EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_GETEQUIPBTN_CLICK:
               this.replay();
               this.panel.getModifyCountEquip();
               PipeManager.sendMsg(PipeConstants.USE_BAG,1);
               this.resumMouseStatus();
               break;
            case EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_USELUCKSTONE:
               this.xingYunJingNum = _loc2_.data.num;
               _loc4_ = this.gaiLv + this.xingYunJingNum * OtherConst.XINGYUNJING_JILV < 100 ? int(this.gaiLv + this.xingYunJingNum * OtherConst.XINGYUNJING_JILV) : 100;
               if(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XUANJINGSHI,true).count >= this.xuanPinShiNum)
               {
                  _loc7_ = LanResManager.getLanTextWords(this,"玄晶石数量",[StaticValue.GREEN_HTML,this.xuanPinShiNum]);
               }
               else
               {
                  _loc7_ = LanResManager.getLanTextWords(this,"玄晶石数量",[StaticValue.RED_HTML,this.xuanPinShiNum]);
               }
               this.panel.setModifyCountExpendGasAndProbability(this.copper,_loc7_,_loc4_);
               break;
            case EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_CLICK:
               if(!this.equip)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入装备"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入装备"));
                  return;
               }
               if(!ItemPositionRange.inBag(this.equip.position))
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"));
                  return;
               }
               if(this.copper > GameInstance.mainCharData.moneyInfo.copper)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("铜币不足"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("铜币不足"),false);
                  return;
               }
               if(this.equip.quality == 1 || this.equip.quality == 6)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"该物品不能合成"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"该物品不能合成"),false);
                  return;
               }
               _loc3_.XY = this.equip.position;
               _loc3_.ID = this.equip.id;
               _loc3_.xingYunJingNum = this.xingYunJingNum;
               this.addLoadBuffer();
               this.sendMsg.send_50187(_loc3_);
               SynthesizeMsg.SynthesizeSmallLoadingBarMsg = LanResManager.getLanTextWords(this,"属性生成中");
               break;
            case EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_CONFIRM_USE_NEW:
               this.panelNewOrOldSelectListener(false);
               this.sendMsg.send_50169({"isOK":1});
               break;
            case EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_CONFIRM_USE_OLD:
               this.panelNewOrOldSelectListener(false);
               this.sendMsg.send_50169({"isOK":0});
               break;
            case EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_GETEQUIPBTN_CLICK:
               this.panel.getModifyValueEquip();
               this.equip = null;
               if(!this.equip)
               {
                  this.replay();
                  PipeManager.sendMsg(PipeConstants.USE_BAG,1);
                  this.resumMouseStatus();
               }
               break;
            case EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_USELUCKSTONE:
               this.xingYunJingNum = _loc2_.data.num;
               _loc4_ = this.gaiLv + this.xingYunJingNum * OtherConst.XINGYUNJING_JILV < 100 ? int(this.gaiLv + this.xingYunJingNum * OtherConst.XINGYUNJING_JILV) : 100;
               if(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XUANJINGSHI,true).count >= this.xuanPinShiNum)
               {
                  _loc7_ = LanResManager.getLanTextWords(this,"玄晶石数量",[StaticValue.GREEN_HTML,this.xuanPinShiNum]);
               }
               else
               {
                  _loc7_ = LanResManager.getLanTextWords(this,"玄晶石数量",[StaticValue.RED_HTML,this.xuanPinShiNum]);
               }
               if(GameState.gongneng114 && Boolean(this.equip))
               {
                  if(this.equip.quality >= 4 && this.xingYunJingNum >= 5)
                  {
                     this.panel.setModifyValueExpendGasAndProbability(this.copper,_loc7_,100);
                  }
                  else
                  {
                     this.panel.setModifyValueExpendGasAndProbability(this.copper,_loc7_,_loc4_);
                  }
               }
               else
               {
                  this.panel.setModifyValueExpendGasAndProbability(this.copper,_loc7_,_loc4_);
               }
               break;
            case EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_SETEQUIPBTN_CLICK:
               this.itemres = GoodsKind.K2;
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               this.openBackpack();
               this.changeMouseStatus();
               break;
            case EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_STARTBTN_CLICK:
               if(!this.equip)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入装备"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入装备"),false);
                  return;
               }
               if(!ItemPositionRange.inBag(this.equip.position))
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
                  return;
               }
               if(this.copper > GameInstance.mainCharData.moneyInfo.copper)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("铜币不足"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("铜币不足"),false);
                  return;
               }
               if(this.equip.quality == 1 || this.equip.quality == 6)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"该物品不能合成"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"该物品不能合成"),false);
                  return;
               }
               _loc3_.XY = this.equip.position;
               _loc3_.ID = this.equip.id;
               _loc3_.xingYunJingNum = this.xingYunJingNum;
               _loc3_.type = 9;
               this.addLoadBuffer();
               this.sendMsg.send_50183(_loc3_);
               SynthesizeMsg.SynthesizeSmallLoadingBarMsg = LanResManager.getLanTextWords(this,"重置附加属性数值中");
               break;
            case EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_CONFIRM_USE_NEW:
               this.panelNewOrOldSelectListener(false);
               this.sendMsg.send_50177({"isOK":1});
               break;
            case EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_CONFIRM_USE_OLD:
               this.panelNewOrOldSelectListener(false);
               this.sendMsg.send_50177({"isOK":0});
               break;
            case EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_GETEQUIPBTN_CLICK:
               this.equip = null;
               this.panel.getZanWenEquip();
               PipeManager.sendMsg(PipeConstants.USE_BAG,1);
               this.resumMouseStatus();
               break;
            case EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_SETEQUIPBTN_CLICK:
               this.itemres = GoodsKind.K2;
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               this.openBackpack();
               this.changeMouseStatus();
               break;
            case EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_STARTBTN_CLICK:
               if(!this.equip)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入装备"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入装备"),false);
                  return;
               }
               if(this.copper > GameInstance.mainCharData.moneyInfo.copper)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("铜币不足"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("铜币不足"),false);
                  return;
               }
               if(!ItemPositionRange.inBag(this.equip.position))
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
                  return;
               }
               if(this.equip.quality == 1 || this.equip.quality == 6)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("很抱歉，无法纹刻图腾属性"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("很抱歉，无法纹刻图腾属性"),false);
                  return;
               }
               _loc8_ = _loc2_.data as Boolean;
               this.zhenHunFuNum = _loc8_ ? 1 : 0;
               if(this.zhenHunFuNum == 0)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请选择使用镇魂符"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请选择使用镇魂符"),false);
                  return;
               }
               this.send50179();
               break;
            case EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_USELUCKSTONE:
               _loc8_ = _loc2_.data as Boolean;
               this.zhenHunFuNum = _loc8_ ? 1 : 0;
               break;
            case EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_TIPCANVAS_OPTION:
               _loc8_ = _loc2_.data as Boolean;
               if(_loc8_)
               {
                  this.send50179();
               }
               break;
            case EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_TIPCANVAS_NEXT_IS_SHOW:
               this.isShowTip = _loc2_.data as Boolean;
         }
      }
      
      private function send50179() : void
      {
         var _loc1_:Object = {};
         _loc1_.XY = this.equip.position;
         _loc1_.ID = this.equip.id;
         _loc1_.xingYunJingNum = this.xingYunJingNum;
         _loc1_.zhenHunFuNum = this.zhenHunFuNum;
         this.addLoadBuffer();
         this.sendMsg.send_50179(_loc1_);
         SynthesizeMsg.SynthesizeSmallLoadingBarMsg = LanResManager.getLanTextWords(this,"战纹刻画中");
      }
      
      private function itemToPanel(param1:ItemFace, param2:Goods = null) : void
      {
         var _loc3_:Object = {};
         if(!param2)
         {
            param2 = param1.getBaseItem() as Goods;
         }
         if(param2)
         {
            if(!ItemPositionRange.inBag(param2.position))
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
               return;
            }
            if(Boolean(param2 && param2.res) && Boolean(param2.res.kind == this.itemres) && this.panelType == EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_SHOW)
            {
               if(param2.quality == 1 || param2.quality == 6 || param2.id == SpecialGoodsID.CHUANSHUO_SHEN_LONG_HU_SHEN_FU || param2.id == SpecialGoodsID.ZHAN_XUESHOU_HU_SHEN_FU)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("很抱歉，无法纹刻图腾属性"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("很抱歉，无法纹刻图腾属性"),false);
                  return;
               }
            }
         }
         if(Boolean(param2) && Boolean(param2.res) && param2.res.kind == this.itemres)
         {
            this.equip = param2;
            PipeManager.sendMsg(PipeConstants.USE_BAG,0);
            if(this.panelType == EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_SHOW)
            {
               _loc3_.type = 12;
            }
            if(this.panelType == EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_SHOW)
            {
               _loc3_.type = 13;
            }
            if(this.panelType == EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_SHOW)
            {
               _loc3_.type = 14;
            }
            _loc3_.XY = param2.position;
            _loc3_.ID = param2.id;
            this.sendMsg.send_50125(_loc3_);
            this.mouseToNormal();
         }
         else if(param1)
         {
            if(this.itemres == GoodsKind.K2)
            {
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"该物品不是装备"),false);
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"该物品不是装备"),false);
            }
         }
      }
      
      private function changeMouseStatus() : void
      {
         TCursorManager.showCursor(TCursorManager.CURSOR_SHOUXING,true);
         TCursorManager.seleteItemOnOtherPanel();
         TCursorManager.lockOnMouseStatus();
      }
      
      private function resumMouseStatus() : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
         {
            TCursorManager.chickItemToPanelFun = null;
            TCursorManager.removeLockOnMouseStatus();
            TCursorManager.resumMouse();
         }
      }
      
      private function mouseToNormal() : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
         {
            TCursorManager.chickItemToPanelFun = function a(param1:*):void
            {
            };
            TCursorManager.mouseToNormal();
         }
      }
      
      private function openBackpack() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._backpack))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
         }
         ResizeManager.showDoublePanel(this.panel,GameInstance.uiInstance.backpack);
      }
      
      private function replay() : void
      {
         this.equip = null;
         this.panel.getModifyCountEquip();
         this.panel.getModifyValueEquip();
         this.panel.getZanWenEquip();
         this.xingYunJingNum = 0;
         this.gaiLv = 0;
         this.zhenQi = 0;
         this.copper = 0;
         this.itemres = 0;
         this.zhenHunFuNum = 0;
      }
      
      private function get sendMsg() : ZhanWenKeHua_MsgSendProxy
      {
         if(this._sendMsg == null)
         {
            this._sendMsg = facade.retrieveProxy(ZhanWenKeHua_MsgSendProxy.NAME) as ZhanWenKeHua_MsgSendProxy;
         }
         return this._sendMsg;
      }
   }
}

