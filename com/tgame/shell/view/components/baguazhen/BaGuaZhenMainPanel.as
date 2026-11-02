package com.tgame.shell.view.components.baguazhen
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.util.Tools;
   import com.greensock.TweenLite;
   import com.tgame.common.GameConfig;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class BaGuaZhenMainPanel extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var menuContainer:Sprite;
      
      private var loadComplete:Boolean;
      
      private var btn_baGua:SimpleButton;
      
      private var btn_1:SimpleButton;
      
      private var btn_2:SimpleButton;
      
      private var btn_3:SimpleButton;
      
      private var btn_4:SimpleButton;
      
      private var btn_5:SimpleButton;
      
      private var btn_6:SimpleButton;
      
      private var btn_7:SimpleButton;
      
      private var btn_8:SimpleButton;
      
      private var img1:MovieClip;
      
      private var img2:MovieClip;
      
      private var imgBG:MovieClip;
      
      private var isOpen:Boolean;
      
      private var arr:Array;
      
      private var index:int = 0;
      
      private var canOpen:Boolean = true;
      
      private var canClose:Boolean = true;
      
      private var currType:Boolean = true;
      
      public function BaGuaZhenMainPanel()
      {
         super();
         this.menuContainer = new Sprite();
         addChild(this.menuContainer);
         this.initUI();
      }
      
      private function initUI() : void
      {
         var main_Menu:MovieClip = null;
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            main_Menu = _loc2_.content as MovieClip;
            menuContainer.addChild(main_Menu);
            btn_baGua = main_Menu.btn_bagua as SimpleButton;
            btn_baGua.addEventListener(MouseEvent.CLICK,onClickBaGuaHandler);
            btn_1 = main_Menu.btn_qian as SimpleButton;
            btn_1.addEventListener(MouseEvent.CLICK,onClickHandler);
            btn_1.alpha = 0;
            btn_2 = main_Menu.btn_dui as SimpleButton;
            btn_2.addEventListener(MouseEvent.CLICK,onClickHandler);
            btn_2.alpha = 0;
            btn_3 = main_Menu.btn_li as SimpleButton;
            btn_3.addEventListener(MouseEvent.CLICK,onClickHandler);
            btn_3.alpha = 0;
            btn_4 = main_Menu.btn_zhen as SimpleButton;
            btn_4.addEventListener(MouseEvent.CLICK,onClickHandler);
            btn_4.alpha = 0;
            btn_5 = main_Menu.btn_kun as SimpleButton;
            btn_5.addEventListener(MouseEvent.CLICK,onClickHandler);
            btn_5.alpha = 0;
            btn_6 = main_Menu.btn_gen as SimpleButton;
            btn_6.addEventListener(MouseEvent.CLICK,onClickHandler);
            btn_6.alpha = 0;
            btn_7 = main_Menu.btn_kan as SimpleButton;
            btn_7.addEventListener(MouseEvent.CLICK,onClickHandler);
            btn_7.alpha = 0;
            btn_8 = main_Menu.btn_xun as SimpleButton;
            btn_8.addEventListener(MouseEvent.CLICK,onClickHandler);
            btn_8.alpha = 0;
            img1 = main_Menu.btn_di1 as MovieClip;
            img2 = main_Menu.btn_di2 as MovieClip;
            img1.visible = currType;
            img2.visible = !currType;
            imgBG = main_Menu.img_bg as MovieClip;
            imgBG.visible = false;
            loadComplete = true;
         },null,false,GameConfig.fileBaseFolder + "res/ui/baguazhen/mian_menu_baguazhen.swf");
      }
      
      private function onClickBaGuaHandler(param1:MouseEvent) : void
      {
         if(!this.isOpen && this.canOpen)
         {
            this.$parent.dispatchEvent(new Event(MainUI.BAGUAZHENMAINUI_PANEL_REQ));
         }
         else if(this.isOpen && this.canClose)
         {
            this.hideBaGuaEffect();
         }
      }
      
      private function onClickHandler(param1:MouseEvent) : void
      {
         if(!(param1.target as SimpleButton).enabled)
         {
            return;
         }
         if(!this.arr)
         {
            return;
         }
         var _loc2_:int = 0;
         switch(param1.target)
         {
            case this.btn_1:
               _loc2_ = int(this.arr[0].index);
               break;
            case this.btn_2:
               _loc2_ = int(this.arr[1].index);
               break;
            case this.btn_3:
               _loc2_ = int(this.arr[2].index);
               break;
            case this.btn_4:
               _loc2_ = int(this.arr[3].index);
               break;
            case this.btn_5:
               _loc2_ = int(this.arr[4].index);
               break;
            case this.btn_6:
               _loc2_ = int(this.arr[5].index);
               break;
            case this.btn_7:
               _loc2_ = int(this.arr[6].index);
               break;
            case this.btn_8:
               _loc2_ = int(this.arr[7].index);
         }
         this.$parent.dispatchEvent(new BaseEvent(MainUI.BAGUAZHENMAINUI_PANEL_CLICK,"",_loc2_));
      }
      
      public function setBaGuaZhenMainData(param1:Object) : void
      {
         this.arr = param1.arr;
         var _loc2_:int = 0;
         while(_loc2_ < param1.leng)
         {
            this["btn_" + (_loc2_ + 1)].enabled = param1.arr[_loc2_].isActive;
            this["btn_" + (_loc2_ + 1)].filters = param1.arr[_loc2_].isActive == true ? [] : Tools.blackWhiteFilter;
            _loc2_++;
         }
         if(!this.isOpen && this.canOpen)
         {
            this.showBaGuaEffect();
         }
      }
      
      private function showBaGuaEffect() : void
      {
         if(this.index < 8)
         {
            this.canOpen = false;
            ++this.index;
            TweenLite.to(this["btn_" + this.index],0.1,{
               "alpha":1,
               "onComplete":this.showBaGuaEffect
            });
            return;
         }
         this.imgBG.visible = true;
         this.isOpen = true;
         this.canClose = true;
      }
      
      private function hideBaGuaEffect() : void
      {
         if(this.index > 0)
         {
            this.imgBG.visible = false;
            this.canClose = false;
            --this.index;
            TweenLite.to(this["btn_" + (this.index + 1)],0.1,{
               "alpha":0,
               "onComplete":this.hideBaGuaEffect
            });
            return;
         }
         this.isOpen = false;
         this.canOpen = true;
      }
      
      public function setDiBanType(param1:Boolean) : void
      {
         this.currType = param1;
         if(this.loadComplete)
         {
            this.img1.visible = this.currType;
            this.img2.visible = !this.currType;
         }
      }
   }
}

