package com.tgame.shell.view.components.ynSpecial
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.util.Tools;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.zcp.manager.LoaderManager;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import game.skin.ShouCiChongZhi20170208Skin;
   import game.utils.SkinTools;
   
   public class YNchongzhi extends BasePanel
   {
      
      private var spr:Sprite;
      
      private var btn:FSimpleButton;
      
      private var closeBtn:FSimpleButton;
      
      private var head:Sprite;
      
      private var selectMc:MovieClip;
      
      private var selectMc1:MovieClip;
      
      private var selectSpr:Sprite;
      
      private var gongImgObj:Object;
      
      private var gongImgObj1:Object;
      
      private var gongImg:Object;
      
      private var bg:DisplayObject;
      
      internal var select:MovieClip;
      
      public function YNchongzhi()
      {
         this.gongImgObj = {};
         this.gongImgObj1 = {};
         this.gongImg = {};
         this.select = new MovieClip();
         super();
         this.skin = SkinTools.getChildSkinByName(ShouCiChongZhi20170208Skin.skin,"xiaofei");
         this.selectSpr = new Sprite();
         this.selectSpr.mouseChildren = false;
         this.selectSpr.mouseEnabled = false;
         this.selectSpr.x = 0;
         this.selectSpr.y = 0;
         addChild(this.selectSpr);
         this.spr = new Sprite();
         addChild(this.spr);
         this.spr.x = -39;
         this.head = new Sprite();
         with(this.head.graphics)
         {
            beginFill(2003199,0);
            drawRect(0,0,430,70);
            endFill();
         }
         this.head.x = 90;
         this.head.y = 10;
         addChild(this.head);
         this.head.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDowns);
         addEventListener(MouseEvent.MOUSE_UP,this.mouseReleaseds);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "ynSCGBBtn";
         addChild(this.closeBtn);
         this.closeBtn.x = 607;
         this.closeBtn.y = 52;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.btn = new FSimpleButton();
         this.btn.skin = "ynSCLQBtn";
         addChild(this.btn);
         this.btn.x = 329;
         this.btn.y = 269;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      override protected function createVariableReference() : void
      {
      }
      
      private function mouseDowns(param1:MouseEvent) : void
      {
         this.parent.setChildIndex(this,parent.numChildren - 1);
         this.startDrag(false,new Rectangle(0,0,Tools.currentStage.stageWidth - this.width,Tools.currentStage.stageHeight - this.height));
      }
      
      private function mouseReleaseds(param1:MouseEvent) : void
      {
         this.stopDrag();
      }
      
      public function gotoClose(param1:MouseEvent) : void
      {
         this.onClose();
      }
      
      override public function onClose(param1:* = null) : void
      {
         super.onClose();
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53095,[40]);
      }
      
      public function setData(param1:Array) : void
      {
         var i:int;
         var selectstr:String = null;
         var urlselect:String = null;
         var urlselect1:String = null;
         var go:Goods = null;
         var item:ItemFace = null;
         var ar:Array = param1;
         while(this.spr.numChildren > 0)
         {
            this.spr.removeChildAt(0);
         }
         while(this.selectSpr.numChildren > 0)
         {
            this.selectSpr.removeChildAt(0);
         }
         selectstr = GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/ynsc_kuang.swf";
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != selectstr)
            {
               return;
            }
            if(gongImg[1] == null)
            {
               select = _loc2_.content as MovieClip;
               gongImg[1] = select;
            }
            else
            {
               select = gongImg[1];
            }
            select.x = 10;
            spr.addChild(select);
         },null,false,selectstr);
         i = 0;
         while(i < ar.length)
         {
            go = new Goods(int(ar[i].id));
            go.count = int(ar[i].num);
            item = new ItemFace(go);
            item.x = 141 + i * 99 - i;
            item.y = 201;
            this.spr.addChild(item);
            i++;
         }
         this.selectMc = new MovieClip();
         urlselect = GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/ynsc_meinv.swf";
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != urlselect)
            {
               return;
            }
            if(Boolean(selectMc) && selectMc.parent != null)
            {
               selectMc.stop();
               selectMc.parent.removeChild(selectMc);
            }
            if(gongImgObj[1] != null)
            {
               selectMc = gongImgObj[1];
            }
            else
            {
               selectMc = _loc2_.content as MovieClip;
               gongImgObj[1] = selectMc;
            }
            if(selectMc)
            {
               selectMc.x = 164;
               selectSpr.addChildAt(selectMc,0);
            }
         },null,false,urlselect);
         this.selectMc1 = new MovieClip();
         urlselect1 = GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/ynsc_star.swf";
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != urlselect1)
            {
               return;
            }
            if(Boolean(selectMc1) && selectMc1.parent != null)
            {
               selectMc1.stop();
               selectMc1.parent.removeChild(selectMc1);
            }
            if(gongImgObj1[1] != null)
            {
               selectMc1 = gongImgObj1[1];
            }
            else
            {
               selectMc1 = _loc2_.content as MovieClip;
               gongImgObj1[1] = selectMc1;
            }
            if(selectMc1)
            {
               selectMc1.x = 164;
               selectSpr.addChildAt(selectMc1,0);
            }
         },null,false,urlselect1);
      }
   }
}

