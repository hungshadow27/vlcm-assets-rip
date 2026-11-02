package com.tgame.shell.view.components.wangzhehuodong
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
   import game.skin.WhangZheZhiBaangSkin;
   import game.utils.SkinTools;
   
   public class YN2017WangzhehuodongPanel extends BasePanel
   {
      
      private var _container:Container;
      
      private var item:ItemFace;
      
      public function YN2017WangzhehuodongPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(WhangZheZhiBaangSkin.skin,"wangzhezhibang");
         this._container = new Container();
         addChild(this._container);
         this._container.mouseEnabled = false;
         this._container.x = 5;
         this._container.y = -24;
         this.init();
      }
      
      private function init() : void
      {
         $("anniu1 anniu2",this,true).click(this.clickHanlder);
         $("YBZLGBAN",this,true).click(function():*
         {
            onClose();
         });
         $("wenben1",this,true).attr("visible",false);
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
         var _loc2_:Array = String(param1.target.name).split("u");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[33,uint(_loc2_[1])]);
      }
   }
}

