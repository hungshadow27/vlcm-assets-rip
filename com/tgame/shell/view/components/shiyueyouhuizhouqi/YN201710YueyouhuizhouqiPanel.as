package com.tgame.shell.view.components.shiyueyouhuizhouqi
{
   import com.asQuery.$;
   import com.fireice.util.Tools;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.skin.YouHuiZhouQiV325Skin;
   import game.utils.SkinTools;
   
   public class YN201710YueyouhuizhouqiPanel extends BasePanel
   {
      
      private var _container:Container;
      
      private var item:ItemFace;
      
      public function YN201710YueyouhuizhouqiPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(YouHuiZhouQiV325Skin.skin,"youhuizhouqiv325");
         this._container = new Container();
         addChild(this._container);
         this._container.mouseEnabled = false;
         this._container.x = 4;
         this._container.y = -75;
         this.init();
      }
      
      private function init() : void
      {
         $("DFZQLQAN1",this,true).click(this.clickHanlder);
         $("YBZLGBAN",this,true).click(function():*
         {
            onClose();
         });
      }
      
      public function setDataGoods(param1:Array) : void
      {
         var _loc2_:Goods = null;
         var _loc3_:int = 0;
         while(this._container.numChildren)
         {
            this._container.removeChildAt(0);
         }
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ = new Goods(9121);
            _loc2_.count = 666;
            this.item = new ItemFace(_loc2_,65,65);
            this.item.x = 46 + 90 * _loc3_;
            this.item.y = 372;
            this.item.mouseEnabled = false;
            this._container.addChild(this.item);
            if(param1[_loc3_] == 1)
            {
               this.item.filters = [];
            }
            else
            {
               this.item.filters = Tools.blackWhiteFilter;
            }
            _loc3_++;
         }
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53099,[40]);
      }
   }
}

