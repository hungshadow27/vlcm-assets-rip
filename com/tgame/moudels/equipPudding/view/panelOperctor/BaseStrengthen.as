package com.tgame.moudels.equipPudding.view.panelOperctor
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.moudels.equipPudding.model.EquipPudding_MsgSendProxy;
   import com.tgame.shell.view.components.EquipPuddingPanel;
   import com.zcp.common.utils.Fun;
   
   public class BaseStrengthen
   {
      
      public static var sendMsgFun:EquipPudding_MsgSendProxy;
      
      private static var loaderBuff:LoadBuffer;
      
      public static var isStrengthenIng:Boolean = false;
      
      public static var nowPanelType:String = EquipPuddingPanel.UI_EQUIPPUDDING_EQUIPSTRENGTHEN_SHOW;
      
      public static var xingYunJingNum:int = 0;
      
      public static var isBind:int = 0;
      
      public static var isXingYunJingBind:int = 0;
      
      public static var tempData:Object = {};
      
      public var equip:Goods;
      
      public var stone:Goods;
      
      public var zhenQi:int;
      
      public var gaiLv:int;
      
      private var useItemNum:int;
      
      private var _equipPuddingPanel:EquipPuddingPanel;
      
      public function BaseStrengthen()
      {
         this._equipPuddingPanel = GameInstance.uiInstance.equipPuddingPanel;
         super();
         this.addListener();
      }
      
      public static function resumMouseStatus() : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
         {
            TCursorManager.chickItemToPanelFun = null;
            TCursorManager.removeLockOnMouseStatus();
            TCursorManager.resumMouse();
         }
      }
      
      public static function addLoadBuffer() : void
      {
         removeLoaderBuff();
         loaderBuff = LoadBuffer.show(GameInstance.uiInstance.equipPuddingPanel);
         isStrengthenIng = true;
      }
      
      public static function removeLoaderBuff() : void
      {
         if(loaderBuff)
         {
            loaderBuff.close();
         }
         loaderBuff = null;
         isStrengthenIng = false;
      }
      
      public function addListener() : void
      {
      }
      
      public function get equipPuddingPanel() : EquipPuddingPanel
      {
         return this._equipPuddingPanel;
      }
      
      public function changeMouseStatus(param1:Boolean = false) : void
      {
         TCursorManager.showCursor(TCursorManager.CURSOR_SHOUXING,param1);
         TCursorManager.seleteItemOnOtherPanel();
         TCursorManager.lockOnMouseStatus();
      }
      
      public function mouseToNormal() : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
         {
            TCursorManager.chickItemToPanelFun = function a(param1:*):void
            {
            };
            TCursorManager.mouseToNormal();
         }
      }
      
      public function openBackpack() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._backpack))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
         }
         ResizeManager.showDoublePanel(this.equipPuddingPanel,GameInstance.uiInstance.backpack);
      }
      
      public function setExpendGasAndProbability(param1:Object = null) : void
      {
         var _loc4_:int = 0;
         var _loc2_:String = this.equip ? "" : LanResManager.getLanCommonTextWords("请先放入装备");
         if(param1)
         {
            this.zhenQi = param1.zhenQi;
            this.gaiLv = param1.gaiLv;
            this.useItemNum = param1.useItemNum;
         }
         var _loc3_:int = this.gaiLv + xingYunJingNum * OtherConst.XINGYUNJING_JILV < 100 ? int(this.gaiLv + xingYunJingNum * OtherConst.XINGYUNJING_JILV) : 100;
         if(BaseStrengthen.nowPanelType == EquipPuddingPanel.UI_EQUIPPUDDING_EQUIPSTRENGTHEN_SHOW)
         {
            if(!param1 && !this.equip)
            {
               this.equipPuddingPanel.setEquipStrengthenExpendGasAndProbability(0,_loc2_,0);
               return;
            }
            if(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.JINGANGSHI_ID,true).count >= this.useItemNum)
            {
               _loc2_ = LanResManager.getLanTextWords(BaseStrengthen,"使用金刚石N颗",[StaticValue.GREEN_HTML,this.useItemNum]);
            }
            else
            {
               _loc2_ = LanResManager.getLanTextWords(BaseStrengthen,"使用金刚石N颗",[StaticValue.RED_HTML,this.useItemNum]);
            }
            this.equipPuddingPanel.setEquipStrengthenExpendGasAndProbability(this.zhenQi,_loc2_,_loc3_);
         }
         if(BaseStrengthen.nowPanelType == EquipPuddingPanel.UI_EQUIPPUDDING_RESETAPPENDATTRIBUTE_SHOW)
         {
            if(!param1 && !this.equip)
            {
               this.equipPuddingPanel.setResetAppendAttributeExpendGasAndProbability(0,_loc2_,0);
               return;
            }
            if(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.JINGLIANSHI_ID,true).count >= this.useItemNum)
            {
               _loc2_ = LanResManager.getLanTextWords(BaseStrengthen,"使用精炼石N颗",[StaticValue.GREEN_HTML,this.useItemNum]);
            }
            else
            {
               _loc2_ = LanResManager.getLanTextWords(BaseStrengthen,"使用精炼石N颗",[StaticValue.RED_HTML,this.useItemNum]);
            }
            if(Boolean(this.equip) && GameState.gongneng104)
            {
               if(this.equip.quality >= 4 && xingYunJingNum >= 5)
               {
                  this.equipPuddingPanel.setResetAppendAttributeExpendGasAndProbability(this.zhenQi,_loc2_,100);
               }
               else
               {
                  this.equipPuddingPanel.setResetAppendAttributeExpendGasAndProbability(this.zhenQi,_loc2_,_loc3_);
               }
            }
            else
            {
               this.equipPuddingPanel.setResetAppendAttributeExpendGasAndProbability(this.zhenQi,_loc2_,_loc3_);
            }
         }
         if(BaseStrengthen.nowPanelType == EquipPuddingPanel.UI_EQUIPPUDDING_RESETSTONEFUSE_SHOW)
         {
            this.equipPuddingPanel.setStoneFuseExpendGasAndProbability(this.zhenQi,_loc3_);
         }
         if(BaseStrengthen.nowPanelType == EquipPuddingPanel.UI_EQUIPPUDDING_RESETSTRENGTHENLEVEL_SHOW)
         {
            if(!param1 && !this.equip)
            {
               this.equipPuddingPanel.setEquipResetStrengthenLevelExpendGasAndProbability(0,_loc2_,0);
               return;
            }
            if(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XILIANSHI_ID,true).count >= this.useItemNum)
            {
               _loc2_ = LanResManager.getLanTextWords(BaseStrengthen,"使用洗炼石N颗",[StaticValue.GREEN_HTML,this.useItemNum]);
            }
            else
            {
               _loc2_ = LanResManager.getLanTextWords(BaseStrengthen,"使用洗炼石N颗",[StaticValue.RED_HTML,this.useItemNum]);
            }
            this.equipPuddingPanel.setEquipResetStrengthenLevelExpendGasAndProbability(this.zhenQi,_loc2_,_loc3_);
         }
         if(BaseStrengthen.nowPanelType == EquipPuddingPanel.UI_EQUIPPUDDING_INNATE_ATTRIBUTE_STRENG_SHOW)
         {
            if(!param1 && !this.equip)
            {
               this.equipPuddingPanel.setInnateAttributeExpendGasAndProbability(0,0,_loc2_,0);
               return;
            }
            _loc4_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.YANGTIANSHI_ID).count;
            if(_loc4_ >= param1.useItemNum)
            {
               _loc2_ = LanResManager.getLanTextWords(BaseStrengthen,"使用养天石N颗",[StaticValue.GREEN_HTML,this.useItemNum]);
            }
            else
            {
               _loc2_ = LanResManager.getLanTextWords(BaseStrengthen,"使用养天石N颗",[StaticValue.RED_HTML,this.useItemNum]);
            }
            this.equipPuddingPanel.setInnateAttributeExpendGasAndProbability(param1.addNum,this.zhenQi,_loc2_,param1.gaiLv);
         }
      }
      
      public function set chickItemToPanelFun(param1:Function) : void
      {
         TCursorManager.chickItemToPanelFun = param1;
      }
      
      public function closePanel() : void
      {
         this.zhenQi = this.gaiLv = 0;
         if(this.equip)
         {
            this.equip = null;
         }
         this.setExpendGasAndProbability(null);
         this.useItemNum = 0;
         resumMouseStatus();
      }
      
      public function itemToBackage() : void
      {
      }
   }
}

