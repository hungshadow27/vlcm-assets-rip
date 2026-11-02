package com.tgame.shell.view.components.shengdanjie
{
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.display.SimpleButton;
   import game.skin.ShengDanJieSkin;
   import game.utils.SkinTools;
   
   public class YN2016ShengdanjiePanel extends BasePanel
   {
      
      private var btn1:SimpleButton;
      
      private var btn2:SimpleButton;
      
      private var btn3:SimpleButton;
      
      private var btn4:SimpleButton;
      
      private var item:ItemFace;
      
      private var guanbi:SimpleButton;
      
      private var _container:Container;
      
      private var arr1:Array = [];
      
      private var arr2:Array = [];
      
      public function YN2016ShengdanjiePanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(ShengDanJieSkin.skin,"shengdanjie");
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
         this.guanbi = getChildByName("YBZLGBAN") as SimpleButton;
         this.arr2 = [null,[712873,1],[712874,1],[726712,1],[726724,1]];
         var _loc2_:int = 1;
         while(_loc2_ < this.arr2.length)
         {
            this["btn" + _loc2_].name = _loc2_;
            _loc1_ = new Goods(this.arr2[_loc2_][0]);
            _loc1_.count = this.arr2[_loc2_][1];
            this.item = new ItemFace(_loc1_,65,65);
            this.item.y = 49 + 76 * _loc2_;
            this.item.x = 553;
            this._container.addChild(this.item);
            _loc2_++;
         }
         this.btn1.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn2.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn3.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn4.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.guanbi.addEventListener(MouseEvent.CLICK,onClose);
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53095,[99,uint(param1.target.name)]);
      }
   }
}

