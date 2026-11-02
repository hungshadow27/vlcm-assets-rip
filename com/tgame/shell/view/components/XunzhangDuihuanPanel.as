package com.tgame.shell.view.components
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
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
   
   public class XunzhangDuihuanPanel extends FPanel
   {
      
      public static const UI_PAGE_BTN_CLICK:String = "UI_PAGE_BTN_CLICK";
      
      public static const UI_START_LAST_BTN_CLICK:String = "UI_START_LAST_BTN_CLICK";
      
      public static const UI_DUIHUAN_BTN_CLICK:String = "UI_DUIHUAN_BTN_CLICK";
      
      private var preBtn:SmallButton;
      
      private var pageCount:FLabel;
      
      private var nextBtn:SmallButton;
      
      private var nameFta:FTextArea;
      
      private var miaoshuFta:FTextArea;
      
      private var duihuanBtn:SecondButton;
      
      private var startBtn:SmallButton;
      
      private var lastBtn:SmallButton;
      
      private var spContainer:Sprite;
      
      private var xzContainer:Sprite;
      
      private var goodsID:int;
      
      private var huode:int;
      
      private var gongMc:MovieClip;
      
      private var mcObj1:Object;
      
      private var loadUrl1:String;
      
      public function XunzhangDuihuanPanel()
      {
         var bg:DisplayObject = null;
         this.mcObj1 = {};
         super();
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 612;
         height = 348;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         titleText = LanResManager.getLanCommonTextWords("稀世藏宝阁");
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/xunzhangduihuan/xunzhangduihuan.swf");
         bg.x = 10;
         bg.y = 2;
         addChild(bg);
         this.startBtn = new SmallButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("首页");
         addChild(this.startBtn);
         this.startBtn.x = 145;
         this.startBtn.y = 282;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.preBtn = new SmallButton();
         this.preBtn.label = LanResManager.getLanCommonTextWords("上一页");
         addChild(this.preBtn);
         this.preBtn.x = 180;
         this.preBtn.y = 282;
         this.preBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.pageCount = new FLabel();
         with(this.pageCount)
         {
            x = 230;
            y = 282;
            textColor = StaticValue.WHITE;
            text = "1/1";
         }
         addChild(this.pageCount);
         this.nextBtn = new SmallButton();
         this.nextBtn.label = LanResManager.getLanCommonTextWords("下一页");
         addChild(this.nextBtn);
         this.nextBtn.x = 254 + 15;
         this.nextBtn.y = 282;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lastBtn = new SmallButton();
         this.lastBtn.label = LanResManager.getLanCommonTextWords("尾页");
         addChild(this.lastBtn);
         this.lastBtn.x = 302 + 15;
         this.lastBtn.y = 282;
         this.lastBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nameFta = new FTextArea();
         with(this.nameFta)
         {
            filters = StaticValue.filter;
            x = 477;
            y = 12;
            width = 120;
            height = 32;
            wordWrap = true;
            htmlText = "";
         }
         addChild(this.nameFta);
         this.miaoshuFta = new FTextArea();
         with(this.miaoshuFta)
         {
            filters = StaticValue.filter;
            width = 133;
            height = 150;
            wordWrap = true;
            x = 467;
            y = 157 - 22;
            textColor = StaticValue.GREEN;
            htmlText = LanResManager.getLanCommonTextWords("玩家可以在活动中得到【稀世珍宝藏宝图】，使用该道具可以在此页面兑换游戏内珍贵道具，升级强化版勋章和普通最终版勋章不能同时佩戴，如有佩戴升级强化版勋章的玩家请注意兑换");
         }
         addChild(this.miaoshuFta);
         this.duihuanBtn = new SecondButton();
         this.duihuanBtn.label = LanResManager.getLanCommonTextWords("兑换");
         addChild(this.duihuanBtn);
         this.duihuanBtn.x = 505;
         this.duihuanBtn.y = 275;
         this.duihuanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.spContainer = new Sprite();
         addChild(this.spContainer);
         this.xzContainer = new Sprite();
         this.xzContainer.x = 496;
         this.xzContainer.y = 67;
         addChild(this.xzContainer);
         with(this.xzContainer.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,65,68);
            endFill();
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.preBtn:
               this.dispatchEvent(new BaseEvent(UI_PAGE_BTN_CLICK,"",1));
               break;
            case this.nextBtn:
               this.dispatchEvent(new BaseEvent(UI_PAGE_BTN_CLICK,"",2));
               break;
            case this.duihuanBtn:
               this.dispatchEvent(new BaseEvent(UI_DUIHUAN_BTN_CLICK,"",[this.goodsID,this.huode]));
               break;
            case this.startBtn:
               this.dispatchEvent(new BaseEvent(UI_START_LAST_BTN_CLICK,"",1));
               break;
            case this.lastBtn:
               this.dispatchEvent(new BaseEvent(UI_START_LAST_BTN_CLICK,"",2));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setXunzhangDuiHuanPanel(param1:Array) : void
      {
         var len:int;
         var i:*;
         var onItemClick:Function;
         var container:Sprite = null;
         var container1:Sprite = null;
         var container2:Sprite = null;
         var go:Goods = null;
         var item:ItemFace = null;
         var go2:Goods = null;
         var item2:ItemFace = null;
         var hdPic:DisplayObject = null;
         var imgSpr:Sprite = null;
         var dhAry:Array = param1;
         while(this.spContainer.numChildren > 0)
         {
            this.spContainer.removeChildAt(0);
         }
         while(this.xzContainer.numChildren > 0)
         {
            this.xzContainer.removeChildAt(0);
         }
         len = int(dhAry.length);
         i = 0;
         while(i < len)
         {
            onItemClick = function(param1:MouseEvent):void
            {
               goodsID = dhAry[int(param1.currentTarget.name)].id;
               huode = dhAry[int(param1.currentTarget.name)].huode;
               container2 = spContainer.getChildByName(param1.currentTarget.name) as Sprite;
               if(gongMc != null)
               {
                  gongMc.x = -1;
                  gongMc.y = -1;
                  container2.addChild(gongMc);
               }
               while(xzContainer.numChildren > 0)
               {
                  xzContainer.removeChildAt(0);
               }
               go2 = new Goods(dhAry[int(param1.currentTarget.name)].id);
               item2 = new ItemFace(go2,65,65);
               xzContainer.addChild(item2);
               nameFta.htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + go2.res.name + "</font></textformat>";
            };
            container = new Sprite();
            this.spContainer.addChild(container);
            with(container.graphics)
            {
               
               beginFill(0,0);
               drawRect(0,0,65,68);
               endFill();
            }
            container.name = i;
            container.addEventListener(MouseEvent.CLICK,onItemClick);
            container.x = i % 5 * (container.width + 23) + 22;
            container.y = int(i / 5) * (container.height + 24) + 14;
            go = new Goods(dhAry[i].id);
            item = new ItemFace(go,65,65);
            item.x = 2;
            item.y = 2;
            container.addChild(item);
            if(dhAry[i].huode == 1)
            {
               imgSpr = new Sprite();
               imgSpr.mouseChildren = false;
               imgSpr.mouseEnabled = false;
               container.addChild(imgSpr);
               hdPic = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/xunzhangduihuan/huode.swf");
               hdPic.y = 13;
               imgSpr.addChild(hdPic);
            }
            if(i == 0)
            {
               this.goodsID = dhAry[i].id;
               this.huode = dhAry[i].huode;
               this.nameFta.htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + go.res.name + "</font></textformat>";
               go2 = new Goods(dhAry[i].id);
               item2 = new ItemFace(go2,65,65);
               this.xzContainer.addChild(item2);
               container1 = this.spContainer.getChildByName(container.name) as Sprite;
               this.loadUrl1 = GameConfig.fileBaseFolder + "res/ui/UIditu/xunzhangduihuan/select.swf";
               if(this.mcObj1[1] != null)
               {
                  if(Boolean(this.gongMc) && this.gongMc.parent != null)
                  {
                     this.gongMc.stop();
                     this.gongMc.parent.removeChild(this.gongMc);
                  }
                  this.gongMc = this.mcObj1[1];
                  this.gongMc.play();
                  this.gongMc.x = -1;
                  this.gongMc.y = -1;
                  container1.addChild(this.gongMc);
               }
               else
               {
                  LoaderManager.lazyLoad(function(param1:Event):void
                  {
                     var _loc2_:LoadingItem = param1.target as LoadingItem;
                     if(_loc2_.url.url != loadUrl1)
                     {
                        return;
                     }
                     if(Boolean(gongMc) && gongMc.parent != null)
                     {
                        gongMc.stop();
                        gongMc.parent.removeChild(gongMc);
                     }
                     gongMc = _loc2_.content as MovieClip;
                     mcObj1[1] = gongMc;
                     if(gongMc)
                     {
                        gongMc.play();
                        gongMc.x = -1;
                        gongMc.y = -1;
                        container1.addChild(gongMc);
                     }
                  },null,false,this.loadUrl1);
               }
            }
            i++;
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

