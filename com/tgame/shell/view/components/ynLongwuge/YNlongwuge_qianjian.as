package com.tgame.shell.view.components.ynLongwuge
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.moudels.ynLongwuge.model.info.YNlongwugeVO;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.loader.vo.LoadData;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   import gs.TweenMax;
   
   public class YNlongwuge_qianjian extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var ft:FTextArea;
      
      private var ftCailiao:FTextArea;
      
      private var ft_shouyi:FTextArea;
      
      private var ft_nextshouyi:FTextArea;
      
      private var ft_nextkucun:FTextArea;
      
      private var ft_copper:FTextArea;
      
      private var ft_yuanbao:FTextArea;
      
      private var ft_level:FTextArea;
      
      private var ft_jpcl:FTextArea;
      
      private var ft_farmer:FTextArea;
      
      private var btn_shouyi:FSimpleButton;
      
      private var btn_addfarmer:SecondButton;
      
      private var btn_up:FSimpleButton;
      
      private var btn_show:FSimpleButton;
      
      private var btn_next:FSimpleButton;
      
      private var btn_pre:FSimpleButton;
      
      private var sprList:Sprite;
      
      private var $mask:Sprite;
      
      private var list:Sprite;
      
      private var listIndex:int = 1;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var sprItem:Sprite;
      
      private var qj_bg:Sprite;
      
      private var mc_bg:Sprite;
      
      private var listY:int = 0;
      
      private var farmerID:int = 0;
      
      private var farmerNum:int = 0;
      
      private var loadUrl1:String;
      
      private var gongMc1:MovieClip;
      
      private var mc_:int = -1;
      
      private var mcObj:Object = {};
      
      private var mainchar:Boolean = true;
      
      public function YNlongwuge_qianjian()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         var right:DisplayObject;
         var img:DisplayObject;
         var farmer:DisplayObject;
         var big_bg:DisplayObject;
         var small_bg:DisplayObject = null;
         var $mask1:Sprite = null;
         var bg:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynLongwuge/qj/qj_bg.swf");
         bg.x = 0;
         bg.y = 2;
         addChild(bg);
         small_bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynLongwuge/qj/qj_kuang_small.swf");
         small_bg.x = 470;
         small_bg.y = 17;
         addChild(small_bg);
         right = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynLongwuge/right.swf");
         right.x = 700;
         right.y = 30;
         addChild(right);
         this.sprItem = new Sprite();
         this.sprItem.x = 750;
         this.sprItem.y = 370;
         addChild(this.sprItem);
         this.qj_bg = new Sprite();
         addChild(this.qj_bg);
         this.mc_bg = new Sprite();
         this.mc_bg.mouseChildren = false;
         this.mc_bg.mouseEnabled = false;
         addChild(this.mc_bg);
         this.ft = new FTextArea();
         this.ft.x = 490;
         this.ft.y = 30;
         this.ft.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("累计收益") + "</font>";
         this.ft.width = 100;
         this.ft.height = 22;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 670;
         this.ft.y = 65;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("1.建筑每升一级都会更换一次外观。") + "</font><br>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("2.建筑等级越高获得的收益越高。") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("3.升级材料可以通过充值活动获得。") + "</font>";
         this.ft.width = 145;
         this.ft.height = 100;
         this.ft.wordWrap = true;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 680;
         this.ft.y = 215;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("金票产量") + "</font>";
         this.ft.width = 100;
         this.ft.height = 22;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 680;
         this.ft.y = 240;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("库存上限") + "</font>";
         this.ft.width = 100;
         this.ft.height = 22;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 680;
         this.ft.y = 315;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("消耗铜币") + "</font>";
         this.ft.width = 100;
         this.ft.height = 22;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 680;
         this.ft.y = 340;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("消耗元宝") + "</font>";
         this.ft.width = 100;
         this.ft.height = 22;
         addChild(this.ft);
         this.ftCailiao = new FTextArea();
         this.ftCailiao.x = 680;
         this.ftCailiao.y = 375;
         this.ftCailiao.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("消耗材料") + "</font>";
         this.ftCailiao.width = 65;
         this.ftCailiao.height = 22;
         addChild(this.ftCailiao);
         this.ft_shouyi = new FTextArea();
         this.ft_shouyi.x = 490;
         this.ft_shouyi.y = 50;
         this.ft_shouyi.textColor = StaticValue.YELLOW;
         this.ft_shouyi.htmlText = "";
         this.ft_shouyi.width = 100;
         this.ft_shouyi.height = 22;
         addChild(this.ft_shouyi);
         img = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynLongwuge/money.swf");
         img.x = 560;
         img.y = 50;
         addChild(img);
         this.ft_nextshouyi = new FTextArea();
         this.ft_nextshouyi.x = 745;
         this.ft_nextshouyi.y = 215;
         this.ft_nextshouyi.textColor = StaticValue.YELLOW;
         this.ft_nextshouyi.htmlText = "";
         this.ft_nextshouyi.width = 100;
         this.ft_nextshouyi.height = 22;
         addChild(this.ft_nextshouyi);
         img = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynLongwuge/money.swf");
         img.x = 790;
         img.y = 215;
         addChild(img);
         this.ft_nextkucun = new FTextArea();
         this.ft_nextkucun.x = 745;
         this.ft_nextkucun.y = 240;
         this.ft_nextkucun.textColor = StaticValue.YELLOW;
         this.ft_nextkucun.htmlText = "";
         this.ft_nextkucun.width = 100;
         this.ft_nextkucun.height = 22;
         addChild(this.ft_nextkucun);
         img = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynLongwuge/money.swf");
         img.x = 790;
         img.y = 240;
         addChild(img);
         this.ft_copper = new FTextArea();
         this.ft_copper.x = 735;
         this.ft_copper.y = 315;
         this.ft_copper.textColor = StaticValue.YELLOW;
         this.ft_copper.htmlText = "";
         this.ft_copper.width = 100;
         this.ft_copper.height = 22;
         addChild(this.ft_copper);
         this.ft_yuanbao = new FTextArea();
         this.ft_yuanbao.x = 735;
         this.ft_yuanbao.y = 340;
         this.ft_yuanbao.textColor = StaticValue.YELLOW;
         this.ft_yuanbao.htmlText = "";
         this.ft_yuanbao.width = 100;
         this.ft_yuanbao.height = 22;
         addChild(this.ft_yuanbao);
         this.ft_farmer = new FTextArea();
         this.ft_farmer.x = 545;
         this.ft_farmer.y = 400 + 30;
         this.ft_farmer.textColor = StaticValue.YELLOW;
         this.ft_farmer.htmlText = "(0)";
         this.ft_farmer.width = 100;
         this.ft_farmer.height = 22;
         addChild(this.ft_farmer);
         farmer = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynLongwuge/qj/farmer.swf");
         farmer.x = 505;
         farmer.y = 400 + 25;
         addChild(farmer);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
         }
         this.tipCanvas.addChild(this.tip);
         this.sprList = new Sprite();
         addChild(this.sprList);
         this.sprList.x = 0;
         this.sprList.y = 460;
         with(this.sprList.graphics)
         {
            beginFill(2003199,0);
            drawRect(0,0,150,440);
            endFill();
         }
         $mask1 = new Sprite();
         $mask1.mouseEnabled = false;
         addChild($mask1);
         $mask1.x = 0;
         $mask1.y = 0;
         with($mask1.graphics)
         {
            beginFill(16750866,0);
            drawRect(0,0,150,440);
            endFill();
         }
         this.sprList.mask = $mask1;
         this.list = new Sprite();
         this.sprList.addChild(this.list);
         with(this.list.graphics)
         {
            x = 0;
            y = 0;
            beginFill(16750866,0);
            drawRect(0,0,150,1100);
            endFill();
         }
         this.$mask = new Sprite();
         this.$mask.mouseEnabled = false;
         this.sprList.addChild(this.$mask);
         this.$mask.x = 0;
         this.$mask.y = 0;
         with(this.$mask.graphics)
         {
            beginFill(16750866,0);
            drawRect(0,0,150,440);
            endFill();
         }
         this.list.mask = this.$mask;
         this.btn_shouyi = new FSimpleButton();
         this.btn_shouyi.x = 585;
         this.btn_shouyi.y = 22;
         this.btn_shouyi.skin = "ynQJshouyiBtn";
         this.btn_shouyi.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn_shouyi);
         this.btn_up = new FSimpleButton();
         this.btn_up.x = 695;
         this.btn_up.y = 410;
         this.btn_up.skin = "ynLWGUpdateBtn";
         this.btn_up.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn_up);
         this.btn_addfarmer = new SecondButton();
         this.btn_addfarmer.x = 580;
         this.btn_addfarmer.y = 430;
         this.btn_addfarmer.label = LanResManager.getLanCommonTextWords("增加农民");
         this.btn_addfarmer.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn_addfarmer);
         this.btn_show = new FSimpleButton();
         this.btn_show.x = 30;
         this.btn_show.y = 410 + 30;
         this.btn_show.skin = "ynQJListBtn";
         this.btn_show.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn_show);
         this.btn_next = new FSimpleButton();
         this.btn_next.x = 45;
         this.btn_next.y = 428;
         this.btn_next.skin = "ynQJListNextBtn";
         this.btn_next.addEventListener(MouseEvent.CLICK,this.onClick);
         this.sprList.addChild(this.btn_next);
         this.btn_pre = new FSimpleButton();
         this.btn_pre.x = 45;
         this.btn_pre.y = 2;
         this.btn_pre.skin = "ynQJListPreBtn";
         this.btn_pre.addEventListener(MouseEvent.CLICK,this.onClick);
         this.sprList.addChild(this.btn_pre);
         big_bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynLongwuge/qj/kuang_big.swf");
         big_bg.x = 170 - 18;
         big_bg.y = 360;
         addChild(big_bg);
         this.ft = new FTextArea();
         this.ft.x = 195;
         this.ft.y = 375;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("钱监等级") + "</font>";
         this.ft.width = 100;
         this.ft.height = 22;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 320;
         this.ft.y = 375;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("金票产量") + "</font>";
         this.ft.width = 100;
         this.ft.height = 22;
         addChild(this.ft);
         this.ft_level = new FTextArea();
         this.ft_level.x = 200;
         this.ft_level.y = 405;
         this.ft_level.textColor = StaticValue.YELLOW;
         this.ft_level.htmlText = "";
         this.ft_level.width = 100;
         this.ft_level.height = 22;
         addChild(this.ft_level);
         this.ft_jpcl = new FTextArea();
         this.ft_jpcl.x = 315;
         this.ft_jpcl.y = 405;
         this.ft_jpcl.textColor = StaticValue.GREEN;
         this.ft_jpcl.htmlText = "";
         this.ft_jpcl.width = 100;
         this.ft_jpcl.height = 22;
         addChild(this.ft_jpcl);
         img = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynLongwuge/money.swf");
         img.x = 375;
         img.y = 405;
         addChild(img);
      }
      
      private function onCom1(param1:FTextArea) : void
      {
         this.btn_next.enabled = !this.btn_next.enabled;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         switch(param1.target)
         {
            case this.btn_addfarmer:
               POPWindowManager.showWindow(GameInstance.uiInstance.ynLWGAddFarmerPanel);
               GameInstance.uiInstance.ynLWGAddFarmerPanel.setData(this.farmerID,this.farmerNum);
               GameInstance.uiInstance.ynLWGAddFarmerPanel.$parent = this.$parent;
               break;
            case this.btn_next:
               ++this.listIndex;
               if(this.listIndex <= 10)
               {
                  _loc2_ = this.listY;
                  this.listY -= 110;
                  TweenMax.to(this.list,1,{"y":_loc2_ - 110});
               }
               if(this.listIndex == 10)
               {
                  this.btn_next.enabled = false;
               }
               if(this.btn_pre.enabled == false)
               {
                  this.btn_pre.enabled = true;
               }
               break;
            case this.btn_pre:
               --this.listIndex;
               if(this.listIndex >= 4)
               {
                  _loc2_ = this.listY;
                  this.listY += 110;
                  TweenMax.to(this.list,1,{"y":_loc2_ + 110});
               }
               if(this.listIndex == 4)
               {
                  this.btn_pre.enabled = false;
               }
               if(this.btn_next.enabled == false)
               {
                  this.btn_next.enabled = true;
               }
               break;
            case this.btn_shouyi:
               this.$parent.dispatchEvent(new BaseEvent(YNlongwugePanel.UI_YN_LONGWUGE_QIANJIAN_SHOUYI_CLICK));
               break;
            case this.btn_show:
               this.listIndex = 4;
               this.btn_pre.enabled = false;
               this.btn_next.enabled = true;
               if(this.sprList.y == 460)
               {
                  this.listY = 0;
                  this.list.y = 0;
                  TweenMax.to(this.sprList,1,{"y":0});
               }
               else
               {
                  this.listY = 0;
                  TweenMax.to(this.sprList,1,{"y":460});
                  this.list.y = 0;
               }
               break;
            case this.btn_up:
               this.$parent.dispatchEvent(new BaseEvent(YNlongwugePanel.UI_YN_LONGWUGE_SHENGJI_CLICK,"",1));
         }
      }
      
      public function setMc(param1:int) : void
      {
         var _loc2_:Array = null;
         if(this.gongMc1 != null)
         {
            this.gongMc1.stop();
         }
         while(this.mc_bg.numChildren > 0)
         {
            this.mc_bg.removeChildAt(0);
         }
         if(this.mcObj["gongMc" + param1] != null)
         {
            this.gongMc1 = this.mcObj["gongMc" + param1];
            if(this.gongMc1)
            {
               this.gongMc1.play();
               this.gongMc1.x = -10;
               this.gongMc1.y = 50;
               this.mc_bg.addChild(this.gongMc1);
            }
         }
         else
         {
            this.loadUrl1 = GameConfig.fileBaseFolder + "res/data/mc/ynLongwuge/" + String(param1) + ".swf";
            _loc2_ = [new LoadData(this.loadUrl1,this.com,null,null,"","gongMc" + param1)];
            LoaderManager.load(_loc2_);
         }
      }
      
      public function removeMc() : void
      {
         if(this.gongMc1 != null)
         {
            this.gongMc1.stop();
         }
         while(this.mc_bg.numChildren > 0)
         {
            this.mc_bg.removeChildAt(0);
         }
      }
      
      private function com(param1:Event) : void
      {
         var _loc2_:LoadingItem = param1.target as LoadingItem;
         var _loc3_:String = _loc2_._id;
         if(_loc2_.url.url != this.loadUrl1)
         {
            return;
         }
         if(this.gongMc1 != null)
         {
            this.gongMc1.stop();
         }
         while(this.mc_bg.numChildren > 0)
         {
            this.mc_bg.removeChildAt(0);
         }
         this.gongMc1 = _loc2_.content as MovieClip;
         this.mcObj[_loc3_] = this.gongMc1;
         if(this.gongMc1)
         {
            this.gongMc1.x = -10;
            this.gongMc1.y = 50;
            this.mc_bg.addChild(this.gongMc1);
         }
      }
      
      private function setQianjianList(param1:Array) : void
      {
         var obj:Object = null;
         var s:String = null;
         var spr:Sprite = null;
         var qj:DisplayObject = null;
         var qjsmall:DisplayObject = null;
         var ftName:FTextArea = null;
         var go:Goods = null;
         var arr:Array = param1;
         var i:int = 0;
         while(i < arr.length)
         {
            obj = arr[i];
            s = "";
            if(int(obj.gid) != 0)
            {
               go = new Goods(int(obj.gid));
               s = LanResManager.getLanCommonTextWords("金票产量") + "：" + obj.ccsd + "/" + obj.jpcl + "<br>" + LanResManager.getLanCommonTextWords("库存上限") + "：" + obj.kcsx + "<br><br>" + LanResManager.getLanCommonTextWords("消耗铜币") + "：" + obj.copper + "<br>" + LanResManager.getLanCommonTextWords("消耗元宝") + "：" + obj.yb + "<br>" + LanResManager.getLanCommonTextWords("消耗材料") + "：" + go.res.name + "<br>" + LanResManager.getLanCommonTextWords("消耗数量") + "：" + obj.gnum;
            }
            else
            {
               s = LanResManager.getLanCommonTextWords("金票产量") + "：" + obj.ccsd + "/" + obj.jpcl + "<br>" + LanResManager.getLanCommonTextWords("库存上限") + "：" + obj.kcsx + "<br><br>" + LanResManager.getLanCommonTextWords("消耗铜币") + "：" + LanResManager.getLanCommonTextWords("已达顶级") + "<br>" + LanResManager.getLanCommonTextWords("消耗元宝") + "：" + LanResManager.getLanCommonTextWords("已达顶级") + "<br>" + LanResManager.getLanCommonTextWords("消耗材料") + "：" + LanResManager.getLanCommonTextWords("已达顶级") + "<br>" + LanResManager.getLanCommonTextWords("消耗数量") + "：0";
            }
            spr = new Sprite();
            with(spr.graphics)
            {
               
               beginFill(2003199,0);
               drawRect(0,0,150,100);
               endFill();
            }
            spr.x = 10;
            spr.y = 5 + 110 * i;
            qj = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynLongwuge/qj/list.swf");
            qj.x = 0;
            qj.y = 2;
            spr.addChild(qj);
            qjsmall = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynLongwuge/qj/" + (i + 1) + "_small.swf");
            qjsmall.x = 32;
            qjsmall.y = 2;
            qjsmall.name = s;
            qjsmall.addEventListener(MouseEvent.MOUSE_OUT,this.onListMouse);
            qjsmall.addEventListener(MouseEvent.MOUSE_OVER,this.onListMouse);
            ftName = new FTextArea();
            ftName.x = 40;
            ftName.y = 78;
            ftName.textColor = StaticValue.YELLOW;
            ftName.htmlText = this.getName(int(obj.level)) + LanResManager.getLanCommonTextWords("钱监");
            ftName.name = s;
            ftName.addEventListener(MouseEvent.MOUSE_OUT,this.onListMouse);
            ftName.addEventListener(MouseEvent.MOUSE_OVER,this.onListMouse);
            spr.addChild(ftName);
            spr.addChild(qjsmall);
            this.list.addChild(spr);
            i++;
         }
      }
      
      private function onListMouse(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:Point = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               Tools.currentStage.addChild(this.tipCanvas);
               this.tipCanvas.visible = false;
               param1.target.addEventListener(MouseEvent.MOUSE_MOVE,this.onListMouse);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(param1.target)
               {
                  _loc2_ = param1.target.name;
                  this.tip.htmlText = _loc2_;
                  this.tipCanvas.width = this.tip.width + 4;
                  this.tipCanvas.height = this.tip.height + 4;
                  this.tipCanvas.visible = true;
                  _loc3_ = param1.target.parent.localToGlobal(new Point(param1.target.x,param1.target.y));
                  this.tipCanvas.x = _loc3_.x - this.tipCanvas.width;
                  this.tipCanvas.y = _loc3_.y;
               }
               else
               {
                  this.tipCanvas.visible = false;
               }
               break;
            case MouseEvent.MOUSE_OUT:
               param1.target.removeEventListener(MouseEvent.MOUSE_MOVE,this.onListMouse);
               if(this.tipCanvas.parent)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
         }
      }
      
      public function setData(param1:YNlongwugeVO) : void
      {
         var _loc6_:Goods = null;
         var _loc7_:ItemFace = null;
         var _loc8_:int = 0;
         var _loc9_:Bitmap = null;
         var _loc10_:String = null;
         this.mainchar = param1.playerID == -1 ? true : false;
         this.ft_jpcl.htmlText = String(param1.ccsd) + "/" + String(param1.jpcl) + LanResManager.getLanCommonTextWords("秒");
         this.ft_level.htmlText = this.getName(param1.level);
         this.ft_shouyi.htmlText = String(param1.dqsy) + "/" + String(param1.ljsy);
         this.farmerID = param1.nmID;
         this.farmerNum = param1.nmGNUM;
         while(this.sprItem.numChildren > 0)
         {
            this.sprItem.removeChildAt(0);
         }
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < param1.qjArr.length)
         {
            _loc3_++;
         }
         if(param1.sjxhwp > 0)
         {
            _loc6_ = new Goods(param1.sjxhwp);
            _loc6_.count = param1.sjxhsl;
            _loc7_ = new ItemFace(_loc6_);
            _loc8_ = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(param1.sjxhwp,true);
            if(_loc8_ < param1.sjxhsl)
            {
               _loc7_.filters = Tools.blackWhiteFilter;
            }
            else
            {
               _loc7_.filters = [];
            }
            if(param1.level == 10)
            {
               _loc7_.setShowCount(false);
               this.ft_copper.htmlText = LanResManager.getLanCommonTextWords("已达顶级");
               this.ft_yuanbao.htmlText = LanResManager.getLanCommonTextWords("已达顶级");
               this.btn_up.enabled = false;
            }
            else
            {
               _loc10_ = param1.sjxhtb > 10000 ? String(Math.floor(param1.sjxhtb / 10000)) + LanResManager.getLanCommonTextWords("万") : String(param1.sjxhtb);
               this.ft_copper.htmlText = _loc10_;
               this.ft_yuanbao.htmlText = String(param1.sjxhyb);
            }
            _loc9_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            _loc9_.x = -2;
            _loc9_.y = -2;
            this.sprItem.addChild(_loc9_);
            this.sprItem.addChild(_loc7_);
            this.ft_nextkucun.htmlText = String(param1.next_kcsx);
            this.ft_nextshouyi.htmlText = String(param1.next_ccsd) + "/" + String(param1.next_jpcl);
         }
         while(this.qj_bg.numChildren > 0)
         {
            this.qj_bg.removeChildAt(0);
         }
         var _loc4_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynLongwuge/qj/" + String(param1.level) + "_big.swf");
         if(param1.level == 1)
         {
            _loc4_.x = 160 + 50;
            _loc4_.y = 10 + 50;
         }
         else
         {
            _loc4_.x = 160;
            _loc4_.y = 10;
         }
         this.qj_bg.addChild(_loc4_);
         this.setQianjianList(param1.qjArr);
         var _loc5_:int = 0;
         if(param1.level == 1 || param1.level == 2 || param1.level == 3 || param1.level == 4 || param1.level == 5)
         {
            _loc5_ = 1;
         }
         else if(param1.level == 6 || param1.level == 7)
         {
            _loc5_ = 2;
         }
         else if(param1.level == 8 || param1.level == 9 || param1.level == 10)
         {
            _loc5_ = 3;
         }
         this.setMc(_loc5_);
         this.setMainChar();
         if(param1.level == 10)
         {
            this.btn_up.enabled = false;
            this.ftCailiao.visible = false;
            this.sprItem.visible = false;
         }
         else
         {
            this.btn_up.enabled = true;
            this.ftCailiao.visible = true;
            this.sprItem.visible = true;
         }
      }
      
      private function getName(param1:int) : String
      {
         var _loc2_:String = "";
         switch(param1)
         {
            case 1:
               _loc2_ = LanResManager.getLanCommonTextWords("一级");
               break;
            case 2:
               _loc2_ = LanResManager.getLanCommonTextWords("二级");
               break;
            case 3:
               _loc2_ = LanResManager.getLanCommonTextWords("三级");
               break;
            case 4:
               _loc2_ = LanResManager.getLanCommonTextWords("四级");
               break;
            case 5:
               _loc2_ = LanResManager.getLanCommonTextWords("五级");
               break;
            case 6:
               _loc2_ = LanResManager.getLanCommonTextWords("六级");
               break;
            case 7:
               _loc2_ = LanResManager.getLanCommonTextWords("七级");
               break;
            case 8:
               _loc2_ = LanResManager.getLanCommonTextWords("八级");
               break;
            case 9:
               _loc2_ = LanResManager.getLanCommonTextWords("九级");
               break;
            case 10:
               _loc2_ = LanResManager.getLanCommonTextWords("十级");
         }
         return _loc2_;
      }
      
      public function setFarmer(param1:int) : void
      {
         this.ft_farmer.htmlText = "(" + String(param1) + ")";
      }
      
      private function setMainChar() : void
      {
         if(!this.mainchar)
         {
            this.btn_addfarmer.enabled = false;
            this.btn_shouyi.enabled = false;
            this.btn_show.enabled = false;
            this.btn_up.enabled = false;
         }
      }
   }
}

