package com.tgame.shell.view.components.shouchong2
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import game.skin.ShouChongLiBaoSkin;
   import game.utils.SkinTools;
   
   public class YN2017ShouChong2Panel extends BasePanel
   {
      
      private var sp:Sprite;
      
      public function YN2017ShouChong2Panel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(ShouChongLiBaoSkin.skin,"shouchonglibao");
         this.sp = new Sprite();
         this.addChild(this.sp);
         this.sp.x = 136;
         this.sp.y = 373;
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
         PipeManager.sendMsg(PipeConstants.SEND_53095,[126]);
      }
   }
}

