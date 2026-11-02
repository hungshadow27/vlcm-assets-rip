package com.tgame.shell.view.components.shengdanjinpiao
{
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.display.SimpleButton;
   import game.skin.ShengDanJieJinPiaoSkin;
   import game.utils.SkinTools;
   
   public class YN2016ShengdanjinpiaoPanel extends BasePanel
   {
      
      private var btn1:SimpleButton;
      
      private var btn2:SimpleButton;
      
      private var btn3:SimpleButton;
      
      private var btn4:SimpleButton;
      
      private var btn5:SimpleButton;
      
      private var btn6:SimpleButton;
      
      private var btn7:SimpleButton;
      
      private var btn8:SimpleButton;
      
      private var btn9:SimpleButton;
      
      private var btn10:SimpleButton;
      
      private var btn11:SimpleButton;
      
      private var btn12:SimpleButton;
      
      private var btn13:SimpleButton;
      
      private var btn14:SimpleButton;
      
      private var item:ItemFace;
      
      private var guanbi:SimpleButton;
      
      private var _container:Container;
      
      private var arr1:Array = [];
      
      private var arr2:Array = [];
      
      public function YN2016ShengdanjinpiaoPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(ShengDanJieJinPiaoSkin.skin,"dhengdanjiejinpiao");
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
         this.btn8 = getChildByName("DFZQLQAN8") as SimpleButton;
         this.btn9 = getChildByName("DFZQLQAN9") as SimpleButton;
         this.btn10 = getChildByName("DFZQLQAN10") as SimpleButton;
         this.btn11 = getChildByName("DFZQLQAN11") as SimpleButton;
         this.btn12 = getChildByName("DFZQLQAN12") as SimpleButton;
         this.btn13 = getChildByName("DFZQLQAN13") as SimpleButton;
         this.btn14 = getChildByName("DFZQLQAN14") as SimpleButton;
         this.guanbi = getChildByName("YBZLGBAN") as SimpleButton;
         this.arr1 = [null,[50201,50],[50201,50],[50201,50],[50201,50],[50201,50],[50201,50],[50201,50]];
         this.arr2 = [null,[50201,100],[50201,100],[50201,100],[50201,100],[50201,100],[50201,100],[50201,100]];
         var _loc2_:int = 1;
         while(_loc2_ < 8)
         {
            this["btn" + _loc2_].name = _loc2_;
            this["btn" + (_loc2_ + 7)].name = _loc2_ + 7;
            _loc1_ = new Goods(this.arr1[_loc2_][0]);
            _loc1_.count = this.arr1[_loc2_][1];
            this.item = new ItemFace(_loc1_,65,65);
            this.item.x = 102 + 90 * _loc2_;
            this.item.y = 185;
            this._container.addChild(this.item);
            _loc1_ = new Goods(this.arr2[_loc2_][0]);
            _loc1_.count = this.arr2[_loc2_][1];
            this.item = new ItemFace(_loc1_,65,65);
            this.item.x = 102 + 90 * _loc2_;
            this.item.y = 185 + 123;
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
         this.btn8.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn9.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn10.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn11.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn12.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn13.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.btn14.addEventListener(MouseEvent.CLICK,this.clickHanlder);
         this.guanbi.addEventListener(MouseEvent.CLICK,onClose);
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53095,[100,uint(param1.target.name)]);
      }
   }
}

