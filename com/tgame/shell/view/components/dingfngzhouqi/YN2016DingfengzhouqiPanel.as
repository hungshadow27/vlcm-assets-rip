package com.tgame.shell.view.components.dingfngzhouqi
{
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.display.SimpleButton;
   import game.skin.DingFengZouQiSkin;
   import game.utils.SkinTools;
   
   public class YN2016DingfengzhouqiPanel extends BasePanel
   {
      
      private var btn1:SimpleButton;
      
      private var btn2:SimpleButton;
      
      private var btn3:SimpleButton;
      
      private var btn4:SimpleButton;
      
      private var btn5:SimpleButton;
      
      private var btn6:SimpleButton;
      
      private var btn7:SimpleButton;
      
      private var item:ItemFace;
      
      private var guanbi:SimpleButton;
      
      private var _container:Container;
      
      private var arr1:Array = [];
      
      private var arr2:Array = [];
      
      public function YN2016DingfengzhouqiPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(DingFengZouQiSkin.skin,"dingfengzhouqi");
      }
      
      override protected function createVariableReference() : void
      {
         var _loc1_:Goods = null;
         this._container = new Container();
         addChild(this._container);
         this._container.x = -148;
         this._container.y = 81;
         this.btn1 = getChildByName("DFZQLQAN1") as SimpleButton;
         this.btn2 = getChildByName("DFZQLQAN2") as SimpleButton;
         this.btn3 = getChildByName("DFZQLQAN3") as SimpleButton;
         this.btn4 = getChildByName("DFZQLQAN4") as SimpleButton;
         this.btn5 = getChildByName("DFZQLQAN5") as SimpleButton;
         this.btn6 = getChildByName("DFZQLQAN6") as SimpleButton;
         this.btn7 = getChildByName("DFZQLQAN7") as SimpleButton;
         this.guanbi = getChildByName("DFZQMBguanbiAN") as SimpleButton;
         this.arr1 = [null,[723896,1],[723896,1],[723896,1],[723896,1],[723896,1],[723896,1],[723896,1]];
         this.arr2 = [null,[41947,10],[41947,10],[41947,10],[41947,10],[41947,10],[41947,10],[41947,10]];
         var _loc2_:int = 1;
         while(_loc2_ < 8)
         {
            this["btn" + _loc2_].name = _loc2_;
            _loc1_ = new Goods(this.arr1[_loc2_][0]);
            _loc1_.count = this.arr1[_loc2_][1];
            this.item = new ItemFace(_loc1_,65,65);
            this.item.x = 102 + 91 * _loc2_;
            this.item.y = 199;
            this._container.addChild(this.item);
            _loc1_ = new Goods(this.arr2[_loc2_][0]);
            _loc1_.count = this.arr2[_loc2_][1];
            this.item = new ItemFace(_loc1_,65,65);
            this.item.x = 102 + 91 * _loc2_;
            this.item.y = 199 + 77;
            this._container.addChild(this.item);
            _loc2_++;
         }
         this.btn1.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn2.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn3.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn4.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn5.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn6.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn7.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.guanbi.addEventListener(MouseEvent.CLICK,onClose);
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53095,[94,uint(param1.target.name)]);
      }
   }
}

