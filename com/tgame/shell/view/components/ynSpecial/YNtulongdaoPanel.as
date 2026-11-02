package com.tgame.shell.view.components.ynSpecial
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class YNtulongdaoPanel extends FPanel
   {
      
      public static const UI_YN_TULONGDAOJIHUO_CLICK:String = "UI_YN_TULONGDAOJIHUO_CLICK";
      
      private var txSpr:Sprite;
      
      private var itemSpr:Sprite;
      
      private var poX:Array = [298,386,428,386,298,206,172,206,250,346];
      
      private var poY:Array = [80,118,205,282,322,282,205,118,200,200];
      
      private var goArr:Array = [724614,350231,724613,350092,724612,724607,724611,724608,724610,724609];
      
      private var ft:FTextArea;
      
      private var txt2:FTextArea;
      
      private var txt3:FTextArea;
      
      private var txt4:FTextArea;
      
      private var txt1:FTextArea;
      
      private var txt5:FTextArea;
      
      private var texiao:DisplayObject;
      
      private var txt6:FTextArea;
      
      public function YNtulongdaoPanel()
      {
         super();
         width = 635;
         height = 485;
         dragAble = true;
         titleText = LanResManager.getLanCommonTextWords("屠龙刀");
         showCloseButton = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var i:int;
         var btn:SecondButton;
         var bg:DisplayObject = null;
         var bit:Bitmap = null;
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/ynTulongdao/bg.swf");
         bg.x = 10;
         bg.y = 2;
         addChild(bg);
         this.txSpr = new Sprite();
         addChild(this.txSpr);
         i = 0;
         while(i < 10)
         {
            bit = StaticValue.getBitmapByClassName("ui.tiem.slot");
            bit.x = int(this.poX[i] - 2);
            bit.y = int(this.poY[i] - 2);
            addChild(bit);
            i++;
         }
         this.itemSpr = new Sprite();
         addChild(this.itemSpr);
         this.ft = new FTextArea();
         this.ft.x = 30;
         this.ft.y = 355;
         this.ft.textColor = StaticValue.YELLOW;
         this.ft.width = 160;
         this.ft.height = 80;
         addChild(this.ft);
         this.txt1 = new FTextArea();
         this.txt1.x = 10;
         this.txt1.y = 10;
         this.txt1.textColor = StaticValue.RED;
         this.txt1.width = 170;
         this.txt1.height = 20;
         this.txt1.htmlText = LanResManager.getLanCommonTextWords("屠龙系统未激活");
         addChild(this.txt1);
         ToolTips.createToolTips(this.txt1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("战斗时有每次攻击无论是否命中必定恢复自身血量3%") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.txt2 = new FTextArea();
         this.txt2.x = 10;
         this.txt2.y = 10;
         this.txt2.textColor = StaticValue.GREEN;
         this.txt2.width = 200;
         this.txt2.height = 20;
         this.txt2.htmlText = LanResManager.getLanCommonTextWords("屠龙系统已激活");
         this.txt2.visible = false;
         addChild(this.txt2);
         ToolTips.createToolTips(this.txt2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.GOLD_HTML\'>" + LanResManager.getLanCommonTextWords("战斗时有每次攻击无论是否命中必定恢复自身血量3%") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.txt3 = new FTextArea();
         this.txt3.x = 10;
         this.txt3.y = 29;
         this.txt3.textColor = StaticValue.GREEN;
         this.txt3.width = 200;
         this.txt3.height = 20;
         this.txt3.htmlText = LanResManager.getLanCommonTextWords("宝刀屠龙");
         addChild(this.txt3);
         ToolTips.createToolTips(this.txt3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.GOLD_HTML\'>" + LanResManager.getLanCommonTextWords("宝刀屠龙激活描述！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.txt4 = new FTextArea();
         this.txt4.x = 10;
         this.txt4.y = 44;
         this.txt4.textColor = StaticValue.GREEN;
         this.txt4.width = 200;
         this.txt4.height = 20;
         this.txt4.htmlText = LanResManager.getLanCommonTextWords("号令天下222");
         addChild(this.txt4);
         ToolTips.createToolTips(this.txt4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.GOLD_HTML\'>" + LanResManager.getLanCommonTextWords("号令天下激活描述！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.txt5 = new FTextArea();
         this.txt5.x = 10;
         this.txt5.y = 60;
         this.txt5.textColor = StaticValue.GREEN;
         this.txt5.width = 200;
         this.txt5.height = 20;
         this.txt5.htmlText = LanResManager.getLanCommonTextWords("称霸武林");
         addChild(this.txt5);
         ToolTips.createToolTips(this.txt5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.GOLD_HTML\'>" + LanResManager.getLanCommonTextWords("增加 1% 回复生命") + "</font>";
            return _loc1_ + "</textformat>";
         });
         btn = new SecondButton();
         btn.x = 521;
         btn.y = 18;
         addChild(btn);
         btn.label = LanResManager.getLanCommonTextWords("倚天剑");
         btn.addEventListener(MouseEvent.CLICK,this.onClickFun);
         this.txt6 = new FTextArea();
         this.txt6.x = 510;
         this.txt6.y = 357;
         this.txt6.textColor = StaticValue.GREEN;
         this.txt6.width = 200;
         this.txt6.height = 20;
         this.txt6.htmlText = new Goods(728523).res.name;
         addChild(this.txt6);
         ToolTips.createToolTips(this.txt6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.GOLD_HTML\'>" + new Goods(728523).res.desc + "</font>";
            return _loc1_ + "</textformat>";
         });
      }
      
      protected function onClickFun(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SHOW_YNYITIANJIAN,-1);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_YN_TULONGDAOJIHUO_CLICK,"",param1.target.name));
      }
      
      public function setData(param1:Array, param2:int) : void
      {
         var _loc5_:Goods = null;
         var _loc6_:ItemFace = null;
         var _loc7_:SecondButton = null;
         var _loc8_:DisplayObject = null;
         var _loc9_:int = 0;
         while(this.txSpr.numChildren > 0)
         {
            this.txSpr.removeChildAt(0);
         }
         while(this.itemSpr.numChildren > 0)
         {
            this.itemSpr.removeChildAt(0);
         }
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc5_ = new Goods(int(param1[_loc4_].gid));
            _loc5_.quality = 6;
            _loc6_ = new ItemFace(_loc5_);
            _loc6_.showLight = true;
            _loc6_.x = int(this.poX[_loc4_]);
            _loc6_.y = int(this.poY[_loc4_]);
            this.itemSpr.addChild(_loc6_);
            _loc7_ = new SecondButton();
            _loc7_.x = int(this.poX[_loc4_] - 2 - 20);
            _loc7_.y = int(this.poY[_loc4_] + 45);
            _loc7_.name = param1[_loc4_].index;
            this.itemSpr.addChild(_loc7_);
            _loc7_.label = LanResManager.getLanCommonTextWords("激活");
            _loc7_.addEventListener(MouseEvent.CLICK,this.onClick);
            if(_loc4_ == 0)
            {
               _loc8_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/ynTulongdao/dao.swf");
               _loc8_.x = 250;
               _loc8_.y = 75;
               this.txSpr.addChild(_loc8_);
            }
            if(int(param1[_loc4_].state) == 1)
            {
               _loc7_.label = LanResManager.getLanCommonTextWords("已激活");
               _loc7_.visible = false;
            }
            else
            {
               _loc7_.visible = true;
               _loc7_.enabled = true;
            }
            if(int(param1[_loc4_].have) == 1 && int(param1[_loc4_].state) == 1)
            {
               _loc3_++;
               _loc9_ = _loc4_ + 1;
               if(_loc4_ == 9 && _loc3_ == 10)
               {
                  _loc9_ = 0;
               }
               if(_loc3_ >= 10)
               {
                  this.txt2.visible = true;
                  this.txt1.visible = false;
               }
               if(_loc4_ != 8)
               {
                  this.setMC(_loc9_);
               }
            }
            _loc4_++;
         }
         this.ft.htmlText = LanResManager.getLanCommonTextWords("攻击") + "：" + 20000000 * param2 + "<br>" + LanResManager.getLanCommonTextWords("防御") + "：" + 20000000 * param2 + "<br>" + LanResManager.getLanCommonTextWords("生命") + "：" + 50000000 * param2 + "<br>" + LanResManager.getLanCommonTextWords("武功层数") + "：" + 20 * param2;
         if(GameState.dictMainStatus[727046])
         {
            this.txt3.textColor = StaticValue.GREEN;
         }
         else
         {
            this.txt3.textColor = StaticValue.HUISE;
         }
         if(GameState.dictMainStatus[727222])
         {
            this.txt4.textColor = StaticValue.GREEN;
         }
         else
         {
            this.txt4.textColor = StaticValue.HUISE;
         }
         if(GameState.dictMainStatus[727710])
         {
            this.txt5.textColor = StaticValue.GREEN;
         }
         else
         {
            this.txt5.textColor = StaticValue.HUISE;
         }
         if(GameState.dictMainStatus[728523])
         {
            this.txt6.textColor = StaticValue.GREEN;
         }
         else
         {
            this.txt6.textColor = StaticValue.HUISE;
         }
      }
      
      private function setMC(param1:int) : void
      {
         var selectMc:MovieClip = null;
         var urlselect:String = null;
         var index:int = param1;
         selectMc = new MovieClip();
         urlselect = GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/ynTulongdao/" + index + ".swf";
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
            selectMc = _loc2_.content as MovieClip;
            if(selectMc)
            {
               selectMc.x = 12;
               txSpr.addChild(selectMc);
            }
         },null,false,urlselect);
      }
   }
}

