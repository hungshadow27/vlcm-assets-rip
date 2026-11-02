package com.tgame.shell.view.components.zhouwuguangliang
{
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.display.SimpleButton;
   import game.skin.ZouWuLangGuangSkin;
   import game.utils.SkinTools;
   
   public class YN2016ZhouwuguangliangPanel extends BasePanel
   {
      
      private var btn1:SimpleButton;
      
      private var btn2:SimpleButton;
      
      private var btn3:SimpleButton;
      
      private var btn4:SimpleButton;
      
      private var btn5:SimpleButton;
      
      private var item:ItemFace;
      
      private var _container:Container;
      
      private var guanbi:SimpleButton;
      
      private var arr:Array = [];
      
      public function YN2016ZhouwuguangliangPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(ZouWuLangGuangSkin.skin,"zhouwuguangliang");
      }
      
      override protected function createVariableReference() : void
      {
         var _loc1_:Goods = null;
         this._container = new Container();
         addChild(this._container);
         this._container.x = -144;
         this._container.y = 45;
         this.btn1 = getChildByName("lingquanniu1") as SimpleButton;
         this.btn2 = getChildByName("lingquanniu2") as SimpleButton;
         this.btn3 = getChildByName("lingquanniu3") as SimpleButton;
         this.btn4 = getChildByName("lingquanniu4") as SimpleButton;
         this.btn5 = getChildByName("lingquanniu5") as SimpleButton;
         this.guanbi = getChildByName("ZWLGGBAN") as SimpleButton;
         this.arr = [null,[42583,200],[42352,10],[42353,10],[41305,10],[41785,10]];
         var _loc2_:int = 1;
         while(_loc2_ < 6)
         {
            this["btn" + _loc2_].name = _loc2_;
            _loc1_ = new Goods(this.arr[_loc2_][0]);
            _loc1_.count = this.arr[_loc2_][1];
            this.item = new ItemFace(_loc1_,65,65);
            this.item.x = 102 + 120 * _loc2_;
            this.item.y = 199;
            this._container.addChild(this.item);
            _loc2_++;
         }
         this.btn1.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn2.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn3.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn4.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn5.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.guanbi.addEventListener(MouseEvent.CLICK,onClose);
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53095,[93,uint(param1.target.name)]);
      }
   }
}

