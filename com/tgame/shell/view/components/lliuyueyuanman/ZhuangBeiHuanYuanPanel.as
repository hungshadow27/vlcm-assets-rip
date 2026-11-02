package com.tgame.shell.view.components.lliuyueyuanman
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.GoodsKind;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.zcp.common.utils.Fun;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.skin.JieMieChaXunSkin;
   import game.utils.SkinTools;
   
   public class ZhuangBeiHuanYuanPanel extends BasePanel
   {
      
      private var _item:ItemFace;
      
      private var _container:Container;
      
      public function ZhuangBeiHuanYuanPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(JieMieChaXunSkin.skin,"zhuangbeihuanyuan");
         this._container = new Container();
         addChild(this._container);
         $("lingqu111",this,true).click(this.onclick);
         $("guanbi",this,true).click(this.gotoClose);
      }
      
      public function setChlidItem(param1:Goods) : void
      {
         if(this._container.numChildren > 0)
         {
            this._container.removeChild(this._item);
         }
         this._item = new ItemFace(param1);
         this._container.addChild(this._item);
         this._item.x = 69;
         this._item.y = 83;
         this.resumMouseStatus();
      }
      
      private function onclick(param1:MouseEvent) : void
      {
         if(this._item)
         {
            PipeManager.sendMsg(PipeConstants.SEND_53095,[127,this._item.getBaseItem().position,this._item.getBaseItem().id]);
            this.gotoClose(null);
         }
      }
      
      private function gotoClose(param1:MouseEvent) : void
      {
         this.onClose();
         if(this._container.numChildren > 0)
         {
            this._container.removeChild(this._item);
         }
         this.resumMouseStatus();
      }
      
      override public function onClose(param1:* = null) : void
      {
         super.onClose();
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setData() : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
         {
            return;
         }
         TCursorManager.chickItemToPanelFun = this.itemToPanel;
         this.openBackpack();
         this.changeMouseStatus();
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
      
      private function openBackpack() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._backpack))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
         }
         ResizeManager.showDoublePanel(this,GameInstance.uiInstance.backpack);
      }
      
      private function itemToPanel(param1:ItemFace, param2:Goods = null) : void
      {
         var _loc4_:Goods = null;
         var _loc3_:Object = {};
         if(!param2)
         {
            param2 = param1.getBaseItem() as Goods;
         }
         if(param2)
         {
            if(param2.position < ItemPositionRange.GOODS_IN_BAG_RANGE.x || param2.position > ItemPositionRange.GOODS_IN_BAG_RANGE.y)
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
               return;
            }
         }
         if(param1)
         {
            _loc4_ = param1.getBaseItem() as Goods;
            if(_loc4_.res.kind != GoodsKind.K2)
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("只能放入指定神兵"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("只能放入指定神兵"),false);
               return;
            }
            this.setChlidItem(_loc4_);
         }
      }
   }
}

