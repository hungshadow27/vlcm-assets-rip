package com.tgame.shell.view.components.moshouzhanchang
{
   import com.asQuery.$;
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   import game.skin.QiangHuaXiaoJieMianSkin;
   import game.utils.SkinTools;
   
   public class DuanLianPanel extends BasePanel
   {
      
      public static const DUANLIAN_CLICK:String = "DUANLIAN_CLICK";
      
      private var lastItem:ItemFace;
      
      private var lastGoods:Goods;
      
      private var nextItem:ItemFace;
      
      public function DuanLianPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(QiangHuaXiaoJieMianSkin.skin,"qianghuajiemian");
         $("guanbi",this,true).click(onClose);
         $("qianghuaanniu",this,true).click(this.onClickHandler);
      }
      
      private function onClickHandler(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(DuanLianPanel.DUANLIAN_CLICK,"",this.lastGoods.position));
      }
      
      public function setDuanLianDataInit(param1:Goods) : void
      {
         this.lastGoods = param1;
         this.lastItem = new ItemFace(param1,65,65);
         this.lastItem.x = 68;
         this.lastItem.y = 92;
         this.addChild(this.lastItem);
      }
      
      public function setDuanLianData(param1:int) : void
      {
         var _loc2_:Goods = null;
         if(param1)
         {
            if(Boolean(this.nextItem) && Boolean(this.nextItem.parent))
            {
               this.nextItem.parent.removeChild(this.nextItem);
               this.nextItem = null;
            }
            _loc2_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(param1);
            if(_loc2_)
            {
               this.nextItem = new ItemFace(_loc2_,65,65);
               this.nextItem.x = 239;
               this.nextItem.y = 92;
               this.addChild(this.nextItem);
            }
         }
      }
   }
}

