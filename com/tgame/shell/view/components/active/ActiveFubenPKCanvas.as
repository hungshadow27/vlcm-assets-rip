package com.tgame.shell.view.components.active
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.shell.view.components.GiftPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.manager.LoaderManager;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   import gs.TweenMax;
   
   public class ActiveFubenPKCanvas extends Sprite
   {
      
      public static const UI_GUAJI_GUANBI_CLICK:String = "UI_GUAJI_GUANBI_CLICK";
      
      public static var tupoBo:Boolean = false;
      
      private var preBtn:SmallButton;
      
      private var pageCount:FLabel;
      
      private var nextBtn:SmallButton;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var fb:FTextArea;
      
      private var ft3:FTextArea;
      
      private var jianjieFt:FTextArea;
      
      private var Scroll:FVScorllBar;
      
      public var $parent:DisplayObject;
      
      private var gongMc:MovieClip;
      
      private var mcObj1:Object;
      
      private var loadUrl1:String;
      
      private var spContainer:Sprite;
      
      private var jianjieSp:Sprite;
      
      private var guajiBtn:SecondButton;
      
      private var lookBtn:SecondButton;
      
      private var gjCanvas:guajiCanvas;
      
      private var gjId:int;
      
      private var pageNow:int;
      
      public function ActiveFubenPKCanvas()
      {
         var bg:DisplayObject;
         var tf:TextFormat;
         var $mask:Sprite;
         this.mcObj1 = {};
         super();
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/richang/huodongyouhua.swf");
         bg.x = 0;
         bg.y = 0;
         addChild(bg);
         this.preBtn = new SmallButton();
         this.preBtn.label = LanResManager.getLanCommonTextWords("上一页");
         addChild(this.preBtn);
         this.preBtn.x = 238;
         this.preBtn.y = 228;
         this.preBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.pageCount = new FLabel();
         with(this.pageCount)
         {
            x = 288;
            y = 228;
            textColor = StaticValue.WHITE;
            text = "1/1";
         }
         addChild(this.pageCount);
         this.nextBtn = new SmallButton();
         this.nextBtn.label = LanResManager.getLanCommonTextWords("下一页");
         addChild(this.nextBtn);
         this.nextBtn.x = 312;
         this.nextBtn.y = 228;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         tf = new TextFormat();
         tf.align = "center";
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            defaultTextFormat = tf;
            x = 5;
            y = 252;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.ft1);
         this.ft2 = new FTextArea();
         with(this.ft2)
         {
            defaultTextFormat = tf;
            x = 238;
            y = 252;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.ft2);
         this.ft3 = new FTextArea();
         with(this.ft3)
         {
            defaultTextFormat = tf;
            x = 426;
            y = 252;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.ft3);
         this.jianjieSp = new Sprite();
         this.jianjieSp.x = 5;
         this.jianjieSp.y = 272;
         addChild(this.jianjieSp);
         with(this.jianjieSp)
         {
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,565,120);
            graphics.endFill();
         }
         this.jianjieFt = new FTextArea();
         with(this.jianjieFt)
         {
            width = 565;
            height = 120;
            multiline = true;
            wordWrap = true;
            filters = StaticValue.filter;
            htmlText = "";
            y = 2;
         }
         this.jianjieSp.addChild(this.jianjieFt);
         this.Scroll = new FVScorllBar(this.jianjieSp,70);
         addChild(this.Scroll);
         this.Scroll.x = 573;
         this.Scroll.y = 273;
         this.spContainer = new Sprite();
         addChild(this.spContainer);
         this.fb = new FTextArea();
         with(this.fb)
         {
            defaultTextFormat = tf;
            x = 190;
            y = 356;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("选中活动后可查看到详细的活动信息。") + "</font></textformat>";
         }
         addChild(this.fb);
         this.lookBtn = new SecondButton();
         this.lookBtn.label = LanResManager.getLanCommonTextWords("查看挂机");
         this.lookBtn.x = 450;
         this.lookBtn.y = 356;
         this.lookBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("手动完成过一次副本或一轮日常/周常活动后，才能使用挂机完成功能，") + "<br>" + LanResManager.getLanCommonTextWords("选中已完成过的副本或日常/周常活动选项后，点击挂机完成按钮") + "<br>" + LanResManager.getLanCommonTextWords("即可将该副本或日常/周常活动加入到挂机列表中，") + "<br>" + LanResManager.getLanCommonTextWords("一小时倒计时结束后即可领取奖励，花费元宝可以立即领取奖励。") + "</font>";
         this.lookBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.guajiBtn = new SecondButton();
         this.guajiBtn.label = LanResManager.getLanCommonTextWords("挂机完成");
         this.guajiBtn.x = 524;
         this.guajiBtn.y = 356;
         this.guajiBtn.visible = true;
         this.guajiBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("消耗10个赏善罚恶令可以挂机完成副本或试炼任务，") + "<br>" + LanResManager.getLanCommonTextWords("需要先完成过一次相应的副本或试炼任务才能使用挂机功能。") + "<br>" + LanResManager.getLanCommonTextWords("VIP进行挂机无需使用赏善罚恶令。") + "</font>";
         this.guajiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.gjCanvas = new guajiCanvas();
         addChild(this.gjCanvas);
         this.gjCanvas.x = 280;
         this.gjCanvas.y = 160;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 599;
         $mask.y = 160;
         with($mask.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,350,250);
            endFill();
         }
         this.gjCanvas.mask = $mask;
         addEventListener(UI_GUAJI_GUANBI_CLICK,this.aa1);
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.onShowLv(false);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.preBtn:
               this.$parent.dispatchEvent(new BaseEvent(GiftPanel.UI_GIFTPANEL_ACTIVE_PAGE_BTN_CLICK,"",1));
               break;
            case this.nextBtn:
               this.$parent.dispatchEvent(new BaseEvent(GiftPanel.UI_GIFTPANEL_ACTIVE_PAGE_BTN_CLICK,"",2));
               break;
            case this.guajiBtn:
               this.$parent.dispatchEvent(new BaseEvent(GiftPanel.UI_GUAJIWANCHENG_BTN_CLICK,"",[0,this.pageNow,this.gjId]));
               break;
            case this.lookBtn:
               this.$parent.dispatchEvent(new BaseEvent(GiftPanel.UI_GUAJIWANCHENG_BTN_CLICK,"",[1,this.pageNow,this.gjId]));
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
         this.gjCanvas._parent2 = param1;
         this.gjCanvas._parent = this;
      }
      
      public function setHuodong(param1:Array) : void
      {
         var len:int;
         var i:*;
         var onItemClick:Function;
         var onBtnClick:Function;
         var container1:Sprite = null;
         var container2:Sprite = null;
         var container:Sprite = null;
         var btnObject:DisplayObject = null;
         var bg:DisplayObject = null;
         var nameLabel:FTextArea = null;
         var cishuLabel:FTextArea = null;
         var jlPic:DisplayObject = null;
         var btn:SecondButton = null;
         var xuanzhongBit:DisplayObject = null;
         var huoreBit:DisplayObject = null;
         var kaiqiBit:DisplayObject = null;
         var addKiqiBit:DisplayObject = null;
         var j:int = 0;
         var hdAry:Array = param1;
         while(this.spContainer.numChildren > 0)
         {
            this.spContainer.removeChildAt(0);
         }
         len = int(hdAry.length);
         i = 0;
         while(i < len)
         {
            onItemClick = function(param1:MouseEvent):void
            {
               if(!hdAry[int(param1.currentTarget.name)].kaiqi)
               {
                  return;
               }
               onShowLv(false);
               gjId = hdAry[int(param1.currentTarget.name)].gjId;
               if(hdAry[int(param1.currentTarget.name)].guaji)
               {
                  guajiBtn.visible = true;
                  if(hdAry[int(param1.currentTarget.name)].guajiJihuo)
                  {
                     guajiBtn.enabled = true;
                  }
                  else
                  {
                     guajiBtn.enabled = false;
                  }
               }
               else
               {
                  guajiBtn.visible = false;
               }
               if(hdAry[int(param1.currentTarget.name)].addKaiqi)
               {
                  if(gongMc != null && gongMc.parent != null)
                  {
                     gongMc.parent.removeChild(gongMc);
                  }
               }
               container2 = spContainer.getChildByName(param1.currentTarget.name) as Sprite;
               if(xuanzhongBit != null)
               {
                  if(hdAry[int(param1.currentTarget.name)].huore)
                  {
                     container2.addChildAt(xuanzhongBit,3);
                  }
                  else
                  {
                     container2.addChildAt(xuanzhongBit,1);
                  }
               }
               ft1.htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动时间:") + "</font>" + hdAry[int(param1.currentTarget.name)].time + "</textformat>";
               ft2.htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动类型:") + "</font>" + hdAry[int(param1.currentTarget.name)].type + "</textformat>";
               ft3.htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("参加条件:") + "</font>" + hdAry[int(param1.currentTarget.name)].condition + "</textformat>";
               jianjieFt.htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + hdAry[int(param1.currentTarget.name)].neirong + "</textformat>";
               Scroll.update();
               Scroll.setScrollPosition(0);
            };
            container = new Sprite();
            this.spContainer.addChild(container);
            with(container.graphics)
            {
               
               beginFill(0,0);
               drawRect(0,0,181,109);
               endFill();
            }
            container.name = i;
            container.addEventListener(MouseEvent.CLICK,onItemClick);
            container.x = i % 3 * (container.width + 10) + 15;
            container.y = int(i / 3) * container.height + 8;
            bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/huodong/" + hdAry[i].id + ".swf");
            container.addChild(bg);
            if(hdAry[i].huore)
            {
               huoreBit = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/huodong/huore.swf");
               huoreBit.x = 30;
               huoreBit.y = 40;
               container.addChild(huoreBit);
            }
            if(i == 0)
            {
               if(hdAry[i].kaiqi)
               {
                  xuanzhongBit = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/huodong/selected.swf");
                  container.addChild(xuanzhongBit);
                  this.ft1.htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动时间:") + "</font>" + hdAry[i].time + "</textformat>";
                  this.ft2.htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动类型:") + "</font>" + hdAry[i].type + "</textformat>";
                  this.ft3.htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("参加条件:") + "</font>" + hdAry[i].condition + "</textformat>";
                  this.jianjieFt.htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + hdAry[i].neirong + "</textformat>";
               }
               else
               {
                  this.ft1.htmlText = "";
                  this.ft2.htmlText = "";
                  this.ft3.htmlText = "";
                  this.jianjieFt.htmlText = "";
               }
               this.gjId = hdAry[i].gjId;
               if(hdAry[i].guaji)
               {
                  this.guajiBtn.visible = true;
                  if(hdAry[i].guajiJihuo)
                  {
                     this.guajiBtn.enabled = true;
                  }
                  else
                  {
                     this.guajiBtn.enabled = false;
                  }
               }
               else
               {
                  this.guajiBtn.visible = false;
               }
            }
            nameLabel = new FTextArea();
            with(nameLabel)
            {
               
               autoSize = TextFieldAutoSize.LEFT;
               textColor = StaticValue.WHITE;
               filters = StaticValue.filter;
               htmlText = hdAry[i].name;
               x = 10;
               y = 8;
            }
            container.addChild(nameLabel);
            if(hdAry[i].cishuTotal)
            {
               cishuLabel = new FTextArea();
               with(cishuLabel)
               {
                  
                  x = 135;
                  y = 8;
                  autoSize = TextFieldAutoSize.LEFT;
                  textColor = StaticValue.WHITE;
                  filters = StaticValue.filter;
                  htmlText = hdAry[i].cishuNow + "/" + hdAry[i].cishuMax;
               }
               container.addChild(cishuLabel);
            }
            if(hdAry[i].btn)
            {
               onBtnClick = function(param1:MouseEvent):void
               {
                  if(hdAry[int(param1.currentTarget.name)].btnType == 1)
                  {
                     MainCharSeachPathManager.mainCharWalk(hdAry[int(param1.currentTarget.name)].NPCid);
                  }
                  else if(hdAry[int(param1.currentTarget.name)].btnType == 2)
                  {
                     if(hdAry[int(param1.currentTarget.name)].btnTypePanel == 1)
                     {
                        if(!Fun.isVisible(GameInstance.uiInstance._bossRefurbishPanel))
                        {
                           PipeManager.sendMsg(PipeConstants.SHOW_BOSS_REFURBISH_PANEL);
                        }
                        GameInstance.uiInstance.bossRefurbishPanel.showKuafu();
                     }
                     else if(hdAry[int(param1.currentTarget.name)].btnTypePanel == 2)
                     {
                        if(!Fun.isVisible(GameInstance.uiInstance._bossRefurbishPanel))
                        {
                           PipeManager.sendMsg(PipeConstants.SHOW_BOSS_REFURBISH_PANEL);
                        }
                        GameInstance.uiInstance.bossRefurbishPanel.showJingjichang();
                     }
                  }
                  if(Fun.isVisible(GameInstance.uiInstance._giftPanel))
                  {
                     PipeManager.sendMsg(PipeConstants.SHOW_GIFT_PLANE);
                  }
               };
               btn = new SecondButton();
               btn.name = i;
               if(hdAry[i].cishuTotal)
               {
                  if(hdAry[i].cishuNow == hdAry[i].cishuMax)
                  {
                     btn.label = LanResManager.getLanCommonTextWords("已完成");
                     btn.enabled = false;
                  }
                  else
                  {
                     btn.label = LanResManager.getLanCommonTextWords("前往接取");
                     btn.enabled = true;
                  }
               }
               else
               {
                  btn.label = LanResManager.getLanCommonTextWords("前往接取");
                  btn.enabled = true;
               }
               container.addChild(btn);
               btn.x = 102;
               btn.y = 78;
               btn.addEventListener(MouseEvent.CLICK,onBtnClick);
            }
            if(!hdAry[i].kaiqi)
            {
               kaiqiBit = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/huodong/weikaiqi.swf");
               container.addChild(kaiqiBit);
            }
            else
            {
               j = 0;
               while(j < hdAry[i].jiangliTotal)
               {
                  jlPic = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/huodong/jiangli/" + hdAry[i].typeAry[j].jiangliType + ".swf");
                  jlPic.x = -7;
                  jlPic.y = 79 - 20 * j;
                  container.addChild(jlPic);
                  j++;
               }
               if(hdAry[i].addKaiqi)
               {
                  container1 = this.spContainer.getChildByName(container.name) as Sprite;
                  this.loadUrl1 = GameConfig.fileBaseFolder + "res/ui/huodong/xinzeng.swf";
                  if(this.mcObj1[1] != null)
                  {
                     if(Boolean(this.gongMc) && this.gongMc.parent != null)
                     {
                        this.gongMc.stop();
                        this.gongMc.parent.removeChild(this.gongMc);
                     }
                     this.gongMc = this.mcObj1[1];
                     this.gongMc.play();
                     container1.addChildAt(this.gongMc,1);
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
                           container1.addChildAt(gongMc,1);
                        }
                     },null,false,this.loadUrl1);
                  }
               }
            }
            i++;
         }
      }
      
      public function setPageCount(param1:int, param2:int) : void
      {
         this.pageCount.text = param1 + "/" + param2;
         this.pageNow = param1;
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
      
      public function setActiveHodong(param1:int, param2:String) : void
      {
         var bg:DisplayObject;
         var lb:FTextArea;
         var pi:Point;
         var si:Point;
         var huodongContainer:Sprite = null;
         var onCom:Function = null;
         var id:int = param1;
         var hdName:String = param2;
         onCom = function():void
         {
            if(Boolean(huodongContainer) && Boolean(huodongContainer.parent))
            {
               huodongContainer.parent.removeChild(huodongContainer);
               huodongContainer = null;
            }
         };
         huodongContainer = new Sprite();
         with(huodongContainer.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,181,109);
            endFill();
         }
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/huodong/" + id + ".swf");
         huodongContainer.addChild(bg);
         lb = new FTextArea();
         with(lb)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.CENTER;
            x = (huodongContainer.width - lb.width) / 2;
            y = huodongContainer.height - 100;
            textColor = StaticValue.YELLOW;
            htmlText = hdName + LanResManager.getLanCommonTextWords("活动已经开启!");
         }
         huodongContainer.addChild(lb);
         pi = localToGlobal(new Point(huodongContainer.x,huodongContainer.y));
         si = GameInstance.uiInstance.mainUI.getmapContainerXY();
         huodongContainer.x = pi.x;
         huodongContainer.y = pi.y;
         huodongContainer.x = (GameConfig.sceneWidth - huodongContainer.width) / 2;
         huodongContainer.y = (GameConfig.sceneHeight - huodongContainer.height) / 2;
         GameInstance.uiInstance.uiContainer.addChild(huodongContainer);
         TweenMax.to(huodongContainer,1,{
            "x":si.x + 25,
            "y":si.y + 85,
            "width":0,
            "height":0,
            "delay":3,
            "onComplete":onCom
         });
      }
      
      public function onShowLv(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.gjCanvas.x == 280)
            {
               TweenMax.to(this.gjCanvas,1,{"x":599});
               this.guajiBtn.enabled = false;
               this.lookBtn.enabled = false;
               tupoBo = true;
            }
         }
         else if(this.gjCanvas.x == 599)
         {
            TweenMax.to(this.gjCanvas,1,{"x":280});
            this.guajiBtn.enabled = true;
            this.lookBtn.enabled = true;
            tupoBo = false;
         }
      }
      
      public function setGuajiPanel(param1:int, param2:int, param3:Array) : void
      {
         this.gjCanvas.setGuajiPanel(param1,param2,param3);
      }
      
      public function addGuajilanNum(param1:int, param2:int) : void
      {
         this.gjCanvas.addGuajilanNum(param1,param2);
      }
   }
}

