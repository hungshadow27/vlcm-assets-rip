package com.tgame.shell.view.components.xunzhangzhanshi
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class XunzhangZhanshiShowPanel extends FPanel
   {
      
      public static const UI_PAGE_BTN_2_CLICK:String = "UI_PAGE_BTN_2_CLICK";
      
      public static const UI_START_LAST_BTN_2_CLICK:String = "UI_START_LAST_BTN_2_CLICK";
      
      public static const ITEM_XIEXIA_CLICK:String = "ITEM_XIEXIA_CLICK";
      
      private var preBtn:SmallButton;
      
      private var pageCount:FLabel;
      
      private var nextBtn:SmallButton;
      
      private var startBtn:SmallButton;
      
      private var lastBtn:SmallButton;
      
      private var spContainer:Sprite;
      
      private var isMainChar:Boolean = false;
      
      private var xiexiaBtn:SmallButton;
      
      private var curGoodsId:int;
      
      private var selectMc:MovieClip;
      
      public function XunzhangZhanshiShowPanel()
      {
         var bg:DisplayObject = null;
         super();
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 640;
         height = 348;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         titleText = LanResManager.getLanCommonTextWords("勋章展示title");
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/xunzhangduihuan/xunzhang.swf");
         bg.x = 10;
         bg.y = 2;
         addChild(bg);
         this.startBtn = new SmallButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("首页");
         addChild(this.startBtn);
         this.startBtn.x = 145 + 80;
         this.startBtn.y = 282;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.preBtn = new SmallButton();
         this.preBtn.label = LanResManager.getLanCommonTextWords("上一页");
         addChild(this.preBtn);
         this.preBtn.x = 180 + 80;
         this.preBtn.y = 282;
         this.preBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.pageCount = new FLabel();
         with(this.pageCount)
         {
            x = 230 + 80;
            y = 282;
            textColor = StaticValue.WHITE;
            text = "1/1";
         }
         addChild(this.pageCount);
         this.nextBtn = new SmallButton();
         this.nextBtn.label = LanResManager.getLanCommonTextWords("下一页");
         addChild(this.nextBtn);
         this.nextBtn.x = 254 + 80 + 15;
         this.nextBtn.y = 282;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lastBtn = new SmallButton();
         this.lastBtn.label = LanResManager.getLanCommonTextWords("尾页");
         addChild(this.lastBtn);
         this.lastBtn.x = 302 + 80 + 15;
         this.lastBtn.y = 282;
         this.lastBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.xiexiaBtn = new SmallButton();
         this.xiexiaBtn.label = LanResManager.getLanCommonTextWords("卸下");
         addChild(this.xiexiaBtn);
         this.xiexiaBtn.x = 302 + 80 + 150;
         this.xiexiaBtn.y = 282;
         this.xiexiaBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.spContainer = new Sprite();
         addChild(this.spContainer);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:Goods = null;
         switch(param1.target)
         {
            case this.preBtn:
               this.dispatchEvent(new BaseEvent(UI_PAGE_BTN_2_CLICK,"",1));
               break;
            case this.nextBtn:
               this.dispatchEvent(new BaseEvent(UI_PAGE_BTN_2_CLICK,"",2));
               break;
            case this.startBtn:
               this.dispatchEvent(new BaseEvent(UI_START_LAST_BTN_2_CLICK,"",1));
               break;
            case this.lastBtn:
               this.dispatchEvent(new BaseEvent(UI_START_LAST_BTN_2_CLICK,"",2));
               break;
            case this.xiexiaBtn:
               if(this.isMainChar)
               {
                  _loc2_ = GameInstance.mainCharData.goodsInfo.hasGoodsInBody(this.curGoodsId);
                  if(_loc2_ != null)
                  {
                     this.dispatchEvent(new BaseEvent(ITEM_XIEXIA_CLICK,"",new ItemFace(_loc2_)));
                  }
               }
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setXunzhangDuiHuanPanel(param1:Boolean, param2:Array) : void
      {
         var len:int;
         var i:*;
         var container:Sprite = null;
         var go:Goods = null;
         var item:ItemFace = null;
         var imgSpr:Sprite = null;
         var hdPic:DisplayObject = null;
         var isMainChar:Boolean = param1;
         var dhAry:Array = param2;
         this.isMainChar = isMainChar;
         this.curGoodsId = 0;
         while(this.spContainer.numChildren > 0)
         {
            this.spContainer.removeChildAt(0);
         }
         len = int(dhAry.length);
         i = 0;
         while(i < len)
         {
            container = new Sprite();
            this.spContainer.addChild(container);
            with(container.graphics)
            {
               
               beginFill(0,0);
               drawRect(0,0,65,68);
               endFill();
            }
            container.name = i;
            container.x = i % 7 * (container.width + 23) + 22;
            container.y = int(i / 7) * (container.height + 24) + 14;
            go = new Goods(dhAry[i].id);
            item = new ItemFace(go,65,65);
            item.x = 2;
            item.y = 2;
            container.addChild(item);
            item.name = i;
            if(isMainChar && dhAry[i].huode == 1)
            {
               item.addEventListener(MouseEvent.CLICK,this.onItemClick);
            }
            if(dhAry[i].huode == 1)
            {
               item.filters = [];
               imgSpr = new Sprite();
               imgSpr.mouseChildren = false;
               imgSpr.mouseEnabled = false;
               container.addChild(imgSpr);
               hdPic = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/xunzhangduihuan/huode.swf");
               hdPic.y = 13;
               imgSpr.addChild(hdPic);
            }
            else
            {
               item.filters = Tools.blackWhiteFilter;
            }
            i++;
         }
         if(isMainChar)
         {
            this.xiexiaBtn.visible = true;
            this.xiexiaBtn.enabled = false;
         }
         else
         {
            this.xiexiaBtn.visible = false;
         }
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         var g:Goods;
         var name:String;
         var spr:Sprite = null;
         var loadUrl:String = null;
         var e:MouseEvent = param1;
         this.curGoodsId = (e.target as ItemFace).getBaseItem().id;
         g = GameInstance.mainCharData.goodsInfo.hasGoodsInBody(this.curGoodsId);
         if(g != null)
         {
            this.xiexiaBtn.enabled = true;
         }
         else
         {
            this.xiexiaBtn.enabled = false;
         }
         name = (e.target as ItemFace).name;
         spr = this.spContainer.getChildByName(name) as Sprite;
         if(this.selectMc)
         {
            if(Boolean(this.selectMc) && this.selectMc.parent != null)
            {
               this.selectMc.stop();
               this.selectMc.parent.removeChild(this.selectMc);
            }
            this.selectMc.play();
            this.selectMc.x = -1;
            this.selectMc.y = -1;
            spr.addChild(this.selectMc);
         }
         else
         {
            loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/xunzhangduihuan/select.swf";
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl)
               {
                  return;
               }
               if(Boolean(selectMc) && selectMc.parent != null)
               {
                  selectMc.stop();
                  selectMc.parent.removeChild(selectMc);
               }
               selectMc = _loc2_.content as MovieClip;
               if(selectMc)
               {
                  selectMc.play();
                  selectMc.x = -1;
                  selectMc.y = -1;
                  spr.addChild(selectMc);
               }
            },null,false,loadUrl);
         }
      }
      
      public function setPageCount(param1:int, param2:int) : void
      {
         this.pageCount.text = param1 + "/" + param2;
         if(param1 == 1 && param2 == 1)
         {
            this.preBtn.enabled = this.nextBtn.enabled = false;
         }
         else
         {
            if(param1 == 1)
            {
               this.preBtn.enabled = false;
            }
            else
            {
               this.preBtn.enabled = true;
            }
            if(param1 == param2)
            {
               this.nextBtn.enabled = false;
            }
            else
            {
               this.nextBtn.enabled = true;
            }
         }
      }
   }
}

