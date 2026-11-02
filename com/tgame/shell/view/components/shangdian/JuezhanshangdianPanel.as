package com.tgame.shell.view.components.shangdian
{
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextInput;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class JuezhanshangdianPanel extends Sprite
   {
      
      private var bgZi:DisplayObject;
      
      private var boxContainer1:Sprite;
      
      private var btnPre:NewSkinButton;
      
      private var btnNext:NewSkinButton;
      
      private var coloseBtn:NewSkinButton;
      
      private var txtCurrScore:FLabel;
      
      private var txtTotalScore:FLabel;
      
      private var duiHuanInput:FTextInput;
      
      private var tz:Sprite;
      
      private var currPage:int = 0;
      
      private var totalPage:int = 0;
      
      public function JuezhanshangdianPanel()
      {
         var _loc1_:DisplayObject = null;
         super();
         _loc1_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/shangdian/bg1.swf");
         _loc1_.x = 10;
         _loc1_.y = 2;
         addChild(_loc1_);
         this.tz = new Sprite();
         this.tz.graphics.beginFill(16711680,0);
         this.tz.graphics.drawRect(0,0,675,80);
         this.tz.graphics.endFill();
         this.tz.width = 675;
         this.tz.height = 80;
         this.tz.x = _loc1_.x;
         this.tz.y = _loc1_.y;
         this.tz.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDowns);
         addEventListener(MouseEvent.MOUSE_UP,this.mouseReleaseds);
         addChild(this.tz);
         this.boxContainer1 = new Sprite();
         addChild(this.boxContainer1);
         this.btnPre = new NewSkinButton();
         this.btnPre.skin = "shangdianzuofanyeBtn";
         this.btnPre.x = 11;
         this.btnPre.y = 272;
         addChild(this.btnPre);
         this.btnPre.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnNext = new NewSkinButton();
         this.btnNext.skin = "shangdianyoufanyeBtn";
         this.btnNext.x = 638;
         this.btnNext.y = 272;
         addChild(this.btnNext);
         this.btnNext.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.coloseBtn = new NewSkinButton();
         this.coloseBtn.skin = "shangdiancloseBtn";
         this.coloseBtn.x = 617;
         this.coloseBtn.y = 34;
         addChild(this.coloseBtn);
         this.coloseBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.txtCurrScore = new FLabel();
         this.txtCurrScore.textColor = StaticValue.GREEN;
         this.txtCurrScore.filters = StaticValue.filter;
         this.txtCurrScore.width = 300;
         this.txtCurrScore.height = 20;
         this.txtCurrScore.x = 87;
         this.txtCurrScore.y = 470;
         addChild(this.txtCurrScore);
         this.txtTotalScore = new FLabel();
         this.txtTotalScore.textColor = StaticValue.GREEN;
         this.txtTotalScore.filters = StaticValue.filter;
         this.txtTotalScore.width = 300;
         this.txtTotalScore.height = 20;
         this.txtTotalScore.x = 245;
         this.txtTotalScore.y = 470;
         addChild(this.txtTotalScore);
      }
      
      private function mouseDowns(param1:MouseEvent) : void
      {
         this.parent.setChildIndex(this,parent.numChildren - 1);
         this.startDrag(false,new Rectangle(0,0,Tools.currentStage.stageWidth,Tools.currentStage.stageHeight));
      }
      
      private function mouseReleaseds(param1:MouseEvent) : void
      {
         this.stopDrag();
      }
      
      private function onChange(param1:Event) : void
      {
         if(int(this.duiHuanInput.text) >= this.totalPage)
         {
            this.duiHuanInput.text = this.totalPage + "";
         }
      }
      
      private function onClickHandler(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.btnNext:
               if(this.currPage < this.totalPage)
               {
                  this.currPage += 1;
               }
               dispatchEvent(new BaseEvent(ZhenpinShangdianPanel.FANYE_CLICK,"",[2,this.currPage]));
               break;
            case this.btnPre:
               if(this.currPage > 1)
               {
                  --this.currPage;
               }
               dispatchEvent(new BaseEvent(ZhenpinShangdianPanel.FANYE_CLICK,"",[2,this.currPage]));
         }
      }
      
      private function onClose(param1:MouseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setYongJiuData(param1:Object = null) : void
      {
         var _loc4_:ShangdianPanelRender = null;
         var _loc2_:Array = param1.arr;
         this.currPage = param1.curPage;
         this.totalPage = param1.maxPage;
         this.btnPre.enabled = param1.curPage <= 1 ? false : true;
         this.btnNext.enabled = param1.curPage == param1.maxPage ? false : true;
         this.removeContainerBoxChildren1();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = new ShangdianPanelRender();
            _loc4_.$parent = this;
            _loc4_.setData(_loc2_[_loc3_],param1.type);
            _loc4_.x = _loc3_ % 6 * 97 + 60;
            _loc4_.y = int(_loc3_ / 6) * 178 + 163;
            this.boxContainer1.addChild(_loc4_);
            _loc3_++;
         }
         this.txtCurrScore.text = LanResManager.getLanCommonTextWords("累计元宝：") + param1.leiji + "";
         this.txtTotalScore.text = LanResManager.getLanCommonTextWords("累计元宝上限：") + param1.leijishangxian + "";
      }
      
      private function removeContainerBoxChildren1() : void
      {
         while(this.boxContainer1.numChildren > 0)
         {
            this.boxContainer1.removeChildAt(0);
         }
      }
   }
}

