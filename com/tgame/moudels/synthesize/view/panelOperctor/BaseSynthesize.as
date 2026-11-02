package com.tgame.moudels.synthesize.view.panelOperctor
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.moudels.synthesize.model.Synthesize_MsgSendProxy;
   import com.tgame.shell.view.components.ItemSynthesizePanel;
   import com.zcp.common.utils.Fun;
   
   public class BaseSynthesize
   {
      
      public static var sendMsgFun:Synthesize_MsgSendProxy;
      
      private static var loaderBuff:LoadBuffer;
      
      public static var isStrengthenIng:Boolean = false;
      
      public static var nowPanelType:String = ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_SHOW;
      
      public static var isBind:int = 0;
      
      public static var isXingYunJingBind:int = 0;
      
      private static var xingYunJing:int = 0;
      
      public static var tempData:Object = {};
      
      public var equip:Goods;
      
      public var zhenQi:int;
      
      public var gaiLv:int;
      
      public var useCopper:int;
      
      private var useItemNum:int;
      
      private var _itemSynthesizePanel:ItemSynthesizePanel;
      
      public function BaseSynthesize()
      {
         this._itemSynthesizePanel = GameInstance.uiInstance.itemSynthesizePanel;
         super();
         this.addListener();
      }
      
      public static function set xingYunJingNum(param1:int) : void
      {
         xingYunJing = param1;
      }
      
      public static function get xingYunJingNum() : int
      {
         return xingYunJing;
      }
      
      public static function addLoadBuffer(param1:Boolean = false) : void
      {
         removeLoaderBuff();
         loaderBuff = param1 ? LoadBuffer.show(GameInstance.uiInstance.itemSynthesizePanel,GameInstance.uiInstance.itemSynthesizePanel.piliangBtn) : LoadBuffer.show(GameInstance.uiInstance.itemSynthesizePanel);
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
      
      public function get itemSynthesizePanel() : ItemSynthesizePanel
      {
         return this._itemSynthesizePanel;
      }
      
      public function changeMouseStatus() : void
      {
         TCursorManager.showCursor(TCursorManager.CURSOR_SHOUXING);
         TCursorManager.seleteItemOnOtherPanel();
         TCursorManager.lockOnMouseStatus();
      }
      
      public function resumMouseStatus() : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
         {
            TCursorManager.chickItemToPanelFun = null;
            TCursorManager.removeLockOnMouseStatus();
            TCursorManager.resumMouse();
         }
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
         ResizeManager.showDoublePanel(this.itemSynthesizePanel,GameInstance.uiInstance.backpack);
      }
      
      public function setExpendGasAndProbability(param1:Object = null, param2:Boolean = false) : void
      {
         var _loc3_:String = null;
         if(param1)
         {
            this.zhenQi = param1.zhenQi;
            this.gaiLv = param1.gaiLv;
            this.useCopper = param1.useCopper;
            this.useItemNum = param1.useItemNum;
         }
         var _loc4_:int = this.gaiLv + xingYunJingNum * OtherConst.XINGYUNJING_JILV < 100 ? int(this.gaiLv + xingYunJingNum * OtherConst.XINGYUNJING_JILV) : 100;
         if(BaseSynthesize.nowPanelType == ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_SHOW)
         {
            if(!this.equip && param2)
            {
               this.itemSynthesizePanel.setEquipSynthesizeExpendGasAndProbability(0,LanResManager.getLanCommonTextWords("请先放入装备"),0);
               return;
            }
            if(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.SHENGJIESHI_ID,true).count >= this.useItemNum)
            {
               _loc3_ = LanResManager.getLanTextWords(BaseSynthesize,"生阶石数量",[StaticValue.GREEN_HTML,this.useItemNum]);
            }
            else
            {
               _loc3_ = LanResManager.getLanTextWords(BaseSynthesize,"生阶石数量",[StaticValue.RED_HTML,this.useItemNum]);
            }
            this.itemSynthesizePanel.setEquipSynthesizeExpendGasAndProbability(this.zhenQi,_loc3_,_loc4_);
         }
         if(BaseSynthesize.nowPanelType == ItemSynthesizePanel.UI_ITEMSYNTESIZE_MATERIALSYNTHESIZE_SHOW)
         {
            if(param2)
            {
               this.itemSynthesizePanel.setMaterialSynthesizeExpendGasAndProbability(0,0);
               return;
            }
            this.itemSynthesizePanel.setMaterialSynthesizeExpendGasAndProbability(this.zhenQi,_loc4_);
         }
         if(BaseSynthesize.nowPanelType == ItemSynthesizePanel.UI_ITEMSYNTESIZE_STONESYNTHESIZE_SHOW)
         {
            if(param2)
            {
               this.itemSynthesizePanel.setStoneSynthesizeExpendGasAndProbability(0,0);
               return;
            }
            this.itemSynthesizePanel.setStoneSynthesizeExpendGasAndProbability(this.zhenQi,_loc4_);
         }
         if(BaseSynthesize.nowPanelType == ItemSynthesizePanel.UI_JINGYANHE_SHOW)
         {
            if(param2)
            {
               this.itemSynthesizePanel.setData(0,0);
               return;
            }
            this.itemSynthesizePanel.setData(this.useCopper,this.gaiLv);
         }
      }
      
      public function set chickItemToPanelFun(param1:Function) : void
      {
         TCursorManager.chickItemToPanelFun = param1;
      }
      
      public function closePanel() : void
      {
         this.zhenQi = this.gaiLv = 0;
         this.useItemNum = 0;
         this.useCopper = 0;
         if(this.equip)
         {
            this.equip = null;
         }
         this.setExpendGasAndProbability(null,true);
         this.resumMouseStatus();
      }
   }
}

