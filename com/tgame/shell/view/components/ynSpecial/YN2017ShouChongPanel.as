package com.tgame.shell.view.components.ynSpecial
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import game.skin.shouchong700x622Skin;
   import game.utils.SkinTools;
   
   public class YN2017ShouChongPanel extends BasePanel
   {
      
      private var sp:Sprite;
      
      public function YN2017ShouChongPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(shouchong700x622Skin.skin,"shouchong");
         this.sp = new Sprite();
         this.addChild(this.sp);
         this.sp.x = 51;
         this.sp.y = 297;
      }
      
      override protected function createVariableReference() : void
      {
         $("YBZLGBAN",this,true).click(function():*
         {
            onClose();
         });
         $("DFZQLQAN1",this,true).click(this.onClick);
      }
      
      public function setData(param1:Object) : void
      {
         var _loc4_:Goods = null;
         var _loc5_:ItemFace = null;
         var _loc2_:Array = param1.ar;
         $("wenben1",this,true).attr("text","" + param1.num);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = new Goods(_loc2_[_loc3_].id);
            _loc4_.count = _loc2_[_loc3_].num;
            _loc5_ = new ItemFace(_loc4_,65,65);
            this.sp.addChild(_loc5_);
            _loc5_.x = 75.5 * _loc3_;
            _loc3_++;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53095,[40]);
      }
   }
}

