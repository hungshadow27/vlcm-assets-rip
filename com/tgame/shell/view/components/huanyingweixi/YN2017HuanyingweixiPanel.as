package com.tgame.shell.view.components.huanyingweixi
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import game.skin.WeixiSkin;
   import game.utils.SkinTools;
   
   public class YN2017HuanyingweixiPanel extends BasePanel
   {
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      private var arr2:Array = [];
      
      private var sp:Sprite;
      
      private var currType:int;
      
      public function YN2017HuanyingweixiPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(WeixiSkin.skin,"weixi");
         this.sp = new Sprite();
         this.addChild(this.sp);
         this.init();
      }
      
      private function init() : void
      {
         $("anniu1 anniu2",this,true).click(this.clickHanlder);
         $("YBZLGBAN",this,true).click(function():*
         {
            onClose();
         });
         $("xiaotu1 xiaotu2 xiaotu3 xiaotu4 xiaotu5",this,true).attr("visible",false);
      }
      
      public function setData(param1:int, param2:int) : void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:Goods = null;
         var _loc6_:ItemFace = null;
         this.currType = param1;
         switch(param1)
         {
            case 27:
               _loc3_ = [714291,714292];
               break;
            case 134:
               _loc3_ = [714291,714292];
         }
         while(this.sp.numChildren)
         {
            this.sp.removeChildAt(0);
         }
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = new Goods(_loc3_[_loc4_]);
            _loc5_.count = 1;
            _loc6_ = new ItemFace(_loc5_,65,65);
            this.sp.addChild(_loc6_);
            if(_loc4_ == 0)
            {
               _loc6_.x = 101;
               _loc6_.y = 198;
            }
            else
            {
               _loc6_.x = 535;
               _loc6_.y = 198;
            }
            _loc4_++;
         }
         _loc4_ = 1;
         while(_loc4_ < 6)
         {
            $("xiaotu" + _loc4_,this,true).attr("visible",false);
            if(_loc4_ <= param2)
            {
               $("xiaotu" + _loc4_,this,true).attr("visible",true);
            }
            _loc4_++;
         }
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("u");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[this.currType,uint(_loc2_[1])]);
      }
   }
}

