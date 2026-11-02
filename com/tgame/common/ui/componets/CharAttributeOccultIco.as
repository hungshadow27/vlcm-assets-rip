package com.tgame.common.ui.componets
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class CharAttributeOccultIco extends Sprite
   {
      
      private var star0:Bitmap;
      
      private var star1:Bitmap;
      
      private var star2:Bitmap;
      
      private var star3:Bitmap;
      
      private var star4:Bitmap;
      
      private var star5:Bitmap;
      
      private var star6:Bitmap;
      
      private var star7:Bitmap;
      
      private var star8:Bitmap;
      
      private var star9:Bitmap;
      
      private var _isAllEquality:Boolean;
      
      private var _isAllPurple:Boolean;
      
      private var _isAllStar:Boolean;
      
      private var _isAllInlay:Boolean;
      
      private var _isAllTianSheng:Boolean;
      
      private var _isHunXinYao:Boolean;
      
      private var _isAll120:Boolean;
      
      private var _isAll150:Boolean;
      
      private var _isAll200:Boolean;
      
      private var _isAllStone:Boolean;
      
      private var _isAllLongStone:Boolean;
      
      private var _niXiSta:Boolean;
      
      private var _fengHuangSta:Boolean;
      
      private var _equality:int;
      
      private var _purple:int;
      
      private var _star:int;
      
      private var _inlay:int;
      
      private var _tianSheng:int;
      
      private var _shengShou:int;
      
      private var _lv120:int;
      
      private var _lv150:int;
      
      private var _lv200:int;
      
      private var _stone:int;
      
      private var _longstone:int;
      
      private var spr:Sprite;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var spr2:Sprite;
      
      private var str2:String;
      
      private var tipCanvas2:FCanvas;
      
      private var tip2:FTextArea;
      
      private var zhanWenSpr:Sprite;
      
      private var spr3:Sprite;
      
      private var str3:String;
      
      private var tipCanvas3:FCanvas;
      
      private var tip3:FTextArea;
      
      private var spr4:Sprite;
      
      private var str4:String = "";
      
      private var tipCanvas4:FCanvas;
      
      private var tip4:FTextArea;
      
      private var _qinglong:int = 0;
      
      private var _baihu:int = 0;
      
      private var _zhuque:int = 0;
      
      private var _xuanwu:int = 0;
      
      private var isNeitishenqi:Boolean;
      
      private var neitishenqi:int;
      
      private var longfuMc:MovieClip;
      
      public var isMainChar:Boolean = true;
      
      private var tianmopo:int;
      
      private var tianmodan:int;
      
      public function CharAttributeOccultIco()
      {
         var fb:FLabel = null;
         var loadUrl:String = null;
         super();
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         fb = new FLabel();
         fb.textColor = StaticValue.ORANGE;
         fb.filters = StaticValue.filter;
         fb.text = LanResManager.getLanCommonTextWords("【组合套装自动激活效果列表】");
         fb.x = 77;
         fb.y = 2;
         this.tipCanvas.addChild(fb);
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 30;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         this.spr = new Sprite();
         addChild(this.spr);
         this.spr.addEventListener(MouseEvent.MOUSE_OVER,this.onMouse);
         this.spr.addEventListener(MouseEvent.MOUSE_OUT,this.onMouse);
         this.tipCanvas2 = new FCanvas();
         this.tipCanvas2.skin = "backGroud";
         this.tipCanvas3 = new FCanvas();
         this.tipCanvas3.skin = "backGroud";
         fb = new FLabel();
         fb.textColor = StaticValue.ORANGE;
         fb.filters = StaticValue.filter;
         fb.text = LanResManager.getLanCommonTextWords("四圣兽刻纹套装属性");
         fb.x = 77;
         fb.y = 2;
         this.tipCanvas3.addChild(fb);
         this.tipCanvas4 = new FCanvas();
         this.tipCanvas4.skin = "backGroud";
         this.tip2 = new FTextArea();
         with(this.tip2)
         {
            x = 5;
            y = 10;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas2.addChild(this.tip2);
         this.zhanWenSpr = new Sprite();
         this.tipCanvas2.addChild(this.zhanWenSpr);
         this.tip3 = new FTextArea();
         with(this.tip3)
         {
            x = 5;
            y = 18;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas3.addChild(this.tip3);
         this.tip4 = new FTextArea();
         with(this.tip4)
         {
            x = 5;
            y = 5;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas4.addChild(this.tip4);
         this.spr2 = new Sprite();
         this.spr2.y = 30;
         this.spr3 = new Sprite();
         this.spr3.y = 80;
         addChild(this.spr3);
         this.spr3.addEventListener(MouseEvent.MOUSE_OVER,this.onMouse3);
         this.spr3.addEventListener(MouseEvent.MOUSE_OUT,this.onMouse3);
         this.spr4 = new Sprite();
         this.spr4.y = 115;
         addChild(this.spr4);
         this.spr4.addEventListener(MouseEvent.MOUSE_OVER,this.onMouse4);
         this.spr4.addEventListener(MouseEvent.MOUSE_OUT,this.onMouse4);
         loadUrl = GameConfig.fileBaseFolder + "res/data/mc/wuhun/long.swf";
         this.longfuMc = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            longfuMc = _loc2_.content as MovieClip;
            longfuMc.x = -10 - 2;
            longfuMc.y = -9;
            longfuMc.play();
         },null,false,loadUrl);
      }
      
      private function onMouse(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               if(this.isMainChar)
               {
                  this.neitishenqi = GameState.dictMainStatus[727217];
               }
               else
               {
                  this.neitishenqi = GameState.dictTargetStatus[727217];
               }
               _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + (this._isAllEquality ? StaticValue.YELLOW_HTML : StaticValue.BLUE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("同阶套装效果") + "</font><font color=\'" + (this._isAllEquality ? StaticValue.GREEN_HTML : StaticValue.BLUE_HTML) + "\'>" + (this._isAllEquality ? LanResManager.getLanCommonTextWords("【已激活】") : LanResManager.getLanTextWords(this,"未激活",[this._equality,12])) + "</font><br>" + "<font color=\'" + (this._isAllEquality ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanTextWords(this,"同阶激活条件",[12,5,5]) + "</font><br>" + "<font color=\'" + (this._isAllPurple ? StaticValue.YELLOW_HTML : StaticValue.BLUE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("全紫套装效果") + "</font><font color=\'" + (this._isAllPurple ? StaticValue.GREEN_HTML : StaticValue.BLUE_HTML) + "\'>" + (this._isAllPurple ? LanResManager.getLanCommonTextWords("【已激活】") : LanResManager.getLanTextWords(this,"未激活",[this._purple,12])) + "</font><br>" + "<font color=\'" + (this
               ._isAllPurple ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanTextWords(this,"全紫激活条件",[12,5,5]) + "</font><br>" + "<font color=\'" + (this._isAllStar ? StaticValue.YELLOW_HTML : StaticValue.BLUE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("满星套装效果") + "</font><font color=\'" + (this._isAllStar ? StaticValue.GREEN_HTML : StaticValue.BLUE_HTML) + "\'>" + (this._isAllStar ? LanResManager.getLanCommonTextWords("【已激活】") : LanResManager.getLanTextWords(this,"未激活",[this._star,12])) + "</font><br>" + "<font color=\'" + (this._isAllStar ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanTextWords(this,"满星激活条件",[12,5,5]) + "</font><br>" + "<font color=\'" + (this._isAllInlay ? StaticValue.YELLOW_HTML : StaticValue.BLUE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("满镶嵌套装效果") + "</font><font color=\'" + (this._isAllInlay ? StaticValue.GREEN_HTML : StaticValue.BLUE_HTML) + "\'>" + (this._isAllInlay ? LanResManager.getLanCommonTextWords("【已激活】") : LanResManager
               .getLanTextWords(this,"未激活",[this._inlay,12])) + "</font><br>" + "<font color=\'" + (this._isAllInlay ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanTextWords(this,"满镶嵌激活条件1",[12,5,5]) + "</font><br>" + "<font color=\'" + (this._isAllTianSheng ? StaticValue.YELLOW_HTML : StaticValue.BLUE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("满天生套装效果") + "</font><font color=\'" + (this._isAllTianSheng ? StaticValue.GREEN_HTML : StaticValue.BLUE_HTML) + "\'>" + (this._isAllTianSheng ? LanResManager.getLanCommonTextWords("【已激活】") : LanResManager.getLanTextWords(this,"未激活",[this._tianSheng,12])) + "</font><br>" + "<font color=\'" + (this._isAllTianSheng ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanTextWords(this,"满天生激活条件",[12,10,10,5,5]) + "<br></font>" + "<font color=\'" + (this._isAll120 ? StaticValue.YELLOW_HTML : StaticValue.BLUE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("120级装备套装效果") + "</font><font color=\'" + (this._isAll120 ? StaticValue
               .GREEN_HTML : StaticValue.BLUE_HTML) + "\'>" + (this._isAll120 ? LanResManager.getLanCommonTextWords("【已激活】") : LanResManager.getLanTextWords(this,"未激活",[this._lv120,12])) + "</font><br>" + "<font color=\'" + (this._isAll120 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("激活条件：全身12件装备均为120级及以上装备") + "<br>" + LanResManager.getLanCommonTextWords("加成效果：攻击 +5%  防御 +5%  暴击 +5%  闪避 +5%") + "<br> " + "                    " + LanResManager.getLanCommonTextWords("所有武功 +2") + "<br></font>" + "<font color=\'" + (this._isAll150 ? StaticValue.YELLOW_HTML : StaticValue.BLUE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("150级装备套装效果") + "</font><font color=\'" + (this._isAll150 ? StaticValue.GREEN_HTML : StaticValue.BLUE_HTML) + "\'>" + (this._isAll150 ? LanResManager.getLanCommonTextWords("【已激活】") : LanResManager.getLanTextWords(this,"未激活",[this._lv150,12])) + "</font><br>" + "<font color=\'" + (this._isAll150 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager
               .getLanCommonTextWords("激活条件：全身12件装备均为150级及以上装备") + "<br>" + LanResManager.getLanCommonTextWords("加成效果：攻击 +10%  防御 +10%  暴击 +10%  闪避 +10%") + "<br> " + "                    " + LanResManager.getLanCommonTextWords("所有武功") + " +12" + "<br></font>" + "<font color=\'" + (this._isAll200 ? StaticValue.YELLOW_HTML : StaticValue.BLUE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("200级装备套装效果") + "</font><font color=\'" + (this._isAll200 ? StaticValue.GREEN_HTML : StaticValue.BLUE_HTML) + "\'>" + (this._isAll200 ? LanResManager.getLanCommonTextWords("【已激活】") : LanResManager.getLanTextWords(this,"未激活",[this._lv200,12])) + "</font><br>" + "<font color=\'" + (this._isAll200 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("激活条件：全身12件装备均为200级及以上装备") + "<br>" + LanResManager.getLanCommonTextWords("攻击：+15%，防守：+15%，暴击：+15%，闪避：+15%，生命：+30%") + "<br> " + "                    " + LanResManager.getLanCommonTextWords("所有武功") + " +10.000" + "<br></font>" + "<font color=\'" + (this
               ._isAll200 && this.isNeitishenqi ? StaticValue.ORANGE_HTML : StaticValue.BLUE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("内体神器") + "</font><font color=\'" + (this._isAll200 && this.isNeitishenqi ? StaticValue.GREEN_HTML : StaticValue.BLUE_HTML) + "\'>" + (this._isAll200 && this.isNeitishenqi ? LanResManager.getLanCommonTextWords("【已激活】") : LanResManager.getLanCommonTextWords("【未激活】")) + "</font><br>" + "<font color=\'" + (this._isAll200 && this.isNeitishenqi ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + this.neitishenqi * 200000 + "/480.000.000.000" + "<br>" + LanResManager.getLanCommonTextWords("内体神器：用内力。当内力只剩下30%就转换成扣血") + "<br></font>" + "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanTextWords(this,"温馨提示") + "<br></font>" + "</textformat>";
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
         }
      }
      
      private function onMouse2(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.showTip2(this.str2);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas2.parent != null)
               {
                  this.tipCanvas2.parent.removeChild(this.tipCanvas2);
               }
         }
      }
      
      private function onMouse3(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + (this._qinglong == 12 ? StaticValue.YELLOW_HTML : StaticValue.BLUE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("青龙套装效果") + "</font><font color=\'" + (this._qinglong == 12 ? StaticValue.GREEN_HTML : StaticValue.BLUE_HTML) + "\'>" + (this._qinglong == 12 ? LanResManager.getLanCommonTextWords("【已激活】") : LanResManager.getLanTextWords(this,"未激活",[this._qinglong,12])) + "</font><br>" + "<font color=\'" + (this._qinglong >= 5 && this._qinglong <= 7 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("集齐5件青龙效果套装，人物将可以获得") + "</font><br>" + "<font color=\'" + (this._qinglong >= 5 && this._qinglong <= 7 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("　　攻击：+2000、防御：+100、血量：+100、暴击；+100、闪避：+100") + "</font><br>" + "<font color=\'" + (this._qinglong >= 8 && this._qinglong <= 11 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("集齐8件青龙效果套装，人物将可以获得") + "</font><br>" + "<font color=\'" + (this
               ._qinglong >= 8 && this._qinglong <= 11 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("　　攻击：+5000、防御：+500、血量：+500、暴击：+500、闪避：+500") + "</font><br>" + "<font color=\'" + (this._qinglong >= 12 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("集齐12件青龙效果套装，人物将可以获得") + "</font><br>" + "<font color=\'" + (this._qinglong >= 12 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("　　攻击：+20000、防御：+1000、血量：+1000、暴击：+1000、闪避：+1000") + "</font><br>" + "<font color=\'" + (this._qinglong >= 12 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("　　具有5%几率触发造成伤害对手两次、攻击增强10%的特殊属性") + "</font><br>" + "<font color=\'" + (this._baihu == 12 ? StaticValue.YELLOW_HTML : StaticValue.BLUE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("白虎套装效果") + "</font><font color=\'" + (this._baihu == 12 ? StaticValue.GREEN_HTML : StaticValue.BLUE_HTML) + "\'>" + (this._baihu == 12 ? LanResManager
               .getLanCommonTextWords("【已激活】") : LanResManager.getLanTextWords(this,"未激活",[this._baihu,12])) + "</font><br>" + "<font color=\'" + (this._baihu >= 5 && this._baihu <= 7 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("集齐5件白虎效果套装，人物将可以获得") + "</font><br>" + "<font color=\'" + (this._baihu >= 5 && this._baihu <= 7 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("　　攻击：+100、防御：+100、血量：+100、暴击：+300、闪避：+100") + "</font><br>" + "<font color=\'" + (this._baihu >= 8 && this._baihu <= 11 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("集齐8件白虎效果套装，人物将可以获得") + "</font><br>" + "<font color=\'" + (this._baihu >= 8 && this._baihu <= 11 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("　　攻击：+500、防御：+500、血量：+500、暴击：+800、闪避：+500") + "</font><br>" + "<font color=\'" + (this._baihu >= 12 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("集齐12件白虎效果套装，人物将可以获得") + "</font><br>" + "<font color=\'" + (this
               ._baihu >= 12 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("　　攻击：+1000、防御：+1000、血量：+1000、暴击：+2000、闪避：+1000") + "</font><br>" + "<font color=\'" + (this._baihu >= 12 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("　　攻击时具有5%几率触发无视对方100%防御、忽视防御10%的特殊属性") + "</font><br>" + "<font color=\'" + (this._zhuque == 12 ? StaticValue.YELLOW_HTML : StaticValue.BLUE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("朱雀套装效果") + "</font><font color=\'" + (this._zhuque == 12 ? StaticValue.GREEN_HTML : StaticValue.BLUE_HTML) + "\'>" + (this._zhuque == 12 ? LanResManager.getLanCommonTextWords("【已激活】") : LanResManager.getLanTextWords(this,"未激活",[this._zhuque,12])) + "</font><br>" + "<font color=\'" + (this._zhuque >= 5 && this._zhuque <= 7 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("集齐5件朱雀效果 套装，人物将可以获得") + "</font><br>" + "<font color=\'" + (this._zhuque >= 5 && this._zhuque <= 7 ? StaticValue
               .ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("　　攻击：+100、防御：+100、血量：+50000、暴击：+100、闪避：+100") + "</font><br>" + "<font color=\'" + (this._zhuque >= 8 && this._zhuque <= 11 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("集齐8件朱雀效果套装，人物将可以获得") + "</font><br>" + "<font color=\'" + (this._zhuque >= 8 && this._zhuque <= 11 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("　　攻击：+500、防御：+500、血量：+150000、暴击：+500、闪避：+500") + "</font><br>" + "<font color=\'" + (this._zhuque >= 12 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("集齐12件朱雀效果套装，人物将可以获得") + "</font><br>" + "<font color=\'" + (this._zhuque >= 12 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("　　攻击：+1000、防御：+1000、血量：+500000、暴击：+1000、闪避：+1000") + "</font><br>" + "<font color=\'" + (this._zhuque >= 12 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("　　具有5%几率触发造成对手反弹100%伤害、反弹伤害10%的特殊属性") + "</font><br>" + "<font color=\'" + (this
               ._xuanwu == 12 ? StaticValue.YELLOW_HTML : StaticValue.BLUE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("玄武套装效果") + "</font><font color=\'" + (this._xuanwu == 12 ? StaticValue.GREEN_HTML : StaticValue.BLUE_HTML) + "\'>" + (this._xuanwu == 12 ? LanResManager.getLanCommonTextWords("【已激活】") : LanResManager.getLanTextWords(this,"未激活",[this._xuanwu,12])) + "</font><br>" + "<font color=\'" + (this._xuanwu >= 5 && this._xuanwu <= 7 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("集齐5件玄武效果套装，人物将可以获得") + "</font><br>" + "<font color=\'" + (this._xuanwu >= 5 && this._xuanwu <= 7 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("　　攻击：+100、防御：+2000、血量：+100、暴击：+100、闪避：+100") + "</font><br>" + "<font color=\'" + (this._xuanwu >= 8 && this._xuanwu <= 11 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("集齐8件玄武效果套装，人物将可以获得") + "</font><br>" + "<font color=\'" + (this._xuanwu >= 8 && this._xuanwu <= 11 ? StaticValue
               .ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("　　攻击：+500、防御：+5000、血量：+500、暴击：+500、闪避：+500") + "</font><br>" + "<font color=\'" + (this._xuanwu >= 12 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("集齐12件玄武效果套装，人物将可以获得") + "</font><br>" + "<font color=\'" + (this._xuanwu >= 12 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("　　攻击：+1000、防御：+20000、血量：+1000、暴击：+1000、闪避：+1000") + "</font><br>" + "<font color=\'" + (this._xuanwu >= 12 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("　　具有5%几率触发造成抵抗对手一次攻击") + "</font><br>" + "<font color=\'" + (this._xuanwu >= 12 ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("　　攻击增强5%、反弹伤害5%、忽视防御5%的特殊属性") + "</font>" + "</textformat>";
               this.showTip3(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas3.parent != null)
               {
                  this.tipCanvas3.parent.removeChild(this.tipCanvas3);
               }
         }
      }
      
      private function onMouse4(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.showTip4(this.str4);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas4.parent != null)
               {
                  this.tipCanvas4.parent.removeChild(this.tipCanvas4);
               }
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         Tools.currentStage.addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 32;
         if(this.tipCanvas.width > GameConfig.sceneWidth - Tools.currentStage.mouseX - 35)
         {
            this.tipCanvas.x = Tools.currentStage.mouseX - this.tipCanvas.width - 10;
         }
         else
         {
            this.tipCanvas.x = Tools.currentStage.mouseX + 35;
         }
         if(this.tipCanvas.height > GameConfig.sceneHeight - Tools.currentStage.mouseY - 35)
         {
            this.tipCanvas.y = Tools.currentStage.mouseY - this.tipCanvas.height;
         }
         else
         {
            this.tipCanvas.y = Tools.currentStage.mouseY + 5;
         }
         if(this.tipCanvas.y < 0)
         {
            this.tipCanvas.y = 20;
         }
      }
      
      private function showTip2(param1:String) : void
      {
         this.tip2.htmlText = param1;
         Tools.currentStage.addChild(this.tipCanvas2);
         this.tipCanvas2.width = this.tip2.width + 10;
         this.tipCanvas2.height = this.tip2.height + 15;
         this.tipCanvas2.x = Tools.currentStage.mouseX + 15;
         this.tipCanvas2.y = Tools.currentStage.mouseY + 25;
      }
      
      private function showTip3(param1:String) : void
      {
         this.tip3.htmlText = param1;
         Tools.currentStage.addChild(this.tipCanvas3);
         this.tipCanvas3.width = this.tip3.width + 10;
         this.tipCanvas3.height = this.tip3.height + 30;
         if(this.tipCanvas3.width > GameConfig.sceneWidth - Tools.currentStage.mouseX - 35)
         {
            this.tipCanvas3.x = Tools.currentStage.mouseX - this.tipCanvas3.width - 10;
         }
         else
         {
            this.tipCanvas3.x = Tools.currentStage.mouseX + 35;
         }
         if(this.tipCanvas3.height > GameConfig.sceneHeight - Tools.currentStage.mouseY - 35)
         {
            this.tipCanvas3.y = Tools.currentStage.mouseY - this.tipCanvas3.height;
         }
         else
         {
            this.tipCanvas3.y = Tools.currentStage.mouseY + 5;
         }
         if(this.tipCanvas3.y < 0)
         {
            this.tipCanvas3.y = 20;
         }
      }
      
      private function showTip4(param1:String) : void
      {
         this.tip4.htmlText = param1;
         Tools.currentStage.addChild(this.tipCanvas4);
         this.tipCanvas4.width = this.tip4.width + 10;
         this.tipCanvas4.height = this.tip4.height + 10;
         this.tipCanvas4.x = Tools.currentStage.mouseX + 15;
         this.tipCanvas4.y = Tools.currentStage.mouseY + 25;
      }
      
      public function setState(param1:Boolean, param2:int, param3:Boolean, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:int, param9:Boolean, param10:int, param11:Boolean, param12:int, param13:Boolean, param14:int, param15:Boolean, param16:int) : void
      {
         this._isAllEquality = param1;
         this._isAllPurple = param3;
         this._isAllStar = param5;
         this._isAllInlay = param7;
         this._isAllTianSheng = param9;
         this._isAll120 = param11;
         this._isAll150 = param13;
         this._isAll200 = param15;
         this._equality = param2;
         this._purple = param4;
         this._star = param6;
         this._inlay = param8;
         this._tianSheng = param10;
         this._lv120 = param12;
         this._lv150 = param14;
         this._lv200 = param16;
         var _loc17_:int = 0;
         if(this._isAllEquality)
         {
            _loc17_ += 1;
         }
         if(this._isAllPurple)
         {
            _loc17_ += 1;
         }
         if(this._isAllStar)
         {
            _loc17_ += 1;
         }
         if(this._isAllInlay)
         {
            _loc17_ += 1;
         }
         if(this._isAllTianSheng)
         {
            _loc17_ += 1;
         }
         if(this._isAllStone)
         {
            _loc17_ += 1;
         }
         while(this.spr.numChildren > 0)
         {
            this.spr.removeChildAt(0);
         }
         switch(_loc17_)
         {
            case 0:
               if(!this.star0)
               {
                  this.star0 = StaticValue.getBitmapByClassName("ui.char.attribute.star." + _loc17_);
               }
               this.spr.addChild(this.star0);
               break;
            case 1:
               if(!this.star1)
               {
                  this.star1 = StaticValue.getBitmapByClassName("ui.char.attribute.star." + _loc17_);
               }
               this.spr.addChild(this.star1);
               break;
            case 2:
               if(!this.star2)
               {
                  this.star2 = StaticValue.getBitmapByClassName("ui.char.attribute.star." + _loc17_);
               }
               this.spr.addChild(this.star2);
               break;
            case 3:
               if(!this.star3)
               {
                  this.star3 = StaticValue.getBitmapByClassName("ui.char.attribute.star." + _loc17_);
               }
               this.spr.addChild(this.star3);
               break;
            case 4:
               if(!this.star4)
               {
                  this.star4 = StaticValue.getBitmapByClassName("ui.char.attribute.star." + _loc17_);
               }
               this.spr.addChild(this.star4);
               break;
            case 5:
               if(!this.star5)
               {
                  this.star5 = StaticValue.getBitmapByClassName("ui.char.attribute.star." + _loc17_);
               }
               this.spr.addChild(this.star5);
               break;
            case 6:
               if(!this.star9)
               {
                  this.star9 = StaticValue.getBitmapByClassName("ui.char.attribute.star." + _loc17_);
               }
               this.spr.addChild(this.star9);
         }
      }
      
      public function setXiantian(param1:Boolean, param2:int, param3:int, param4:int) : void
      {
         while(this.spr2.numChildren > 0)
         {
            this.spr2.removeChildAt(0);
         }
         while(this.zhanWenSpr.numChildren > 0)
         {
            this.zhanWenSpr.removeChildAt(0);
         }
         var _loc5_:String = "";
         if(param2 == 0)
         {
            _loc5_ = "#5c5c5c";
         }
         else
         {
            _loc5_ = StaticValue.GREEN_HTML;
         }
         if(param1)
         {
            this.str2 = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("先天武境隐藏属性") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前状态：【已激活】") + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,"激活条件：全部12件装备已是满天生加成") + "</font><br />" + "<font color=\'" + _loc5_ + "\'>" + LanResManager.getLanCommonTextWords("天生内功神丹加成：") + param2 + "</font><br />" + "<font color=\'" + _loc5_ + "\'>" + LanResManager.getLanCommonTextWords("天生内功越高则为角色带来的属性加成越高") + "</font><br>";
         }
         else
         {
            this.str2 = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("先天武境隐藏属性") + "</font><br>" + "<font color=\'" + StaticValue.SKY_BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前状态：【未激活】") + "</font><br>" + "<font color=\'#5c5c5c\'>" + LanResManager.getLanTextWords(this,"激活条件：全部12件装备已是满天生加成") + "</font><br />" + "<font color=\'" + _loc5_ + "\'>" + LanResManager.getLanCommonTextWords("天生内功神丹加成：") + param2 + "</font><br />" + "<font color=\'" + _loc5_ + "\'>" + LanResManager.getLanCommonTextWords("天生内功越高则为角色带来的属性加成越高") + "</font><br>";
         }
         switch(param3)
         {
            case 1:
               this.str2 += "<font color=\'" + (param3 == 1 ? StaticValue.RED_HTML : "#5c5c5c") + "\'>" + (param3 == 1 ? LanResManager.getLanCommonTextWords("(使用)") : LanResManager.getLanCommonTextWords("(未使用)")) + LanResManager.getLanCommonTextWords("神农百草1品") + "</font><br>" + "</textformat>";
               break;
            case 2:
               this.str2 += "<font color=\'" + (param3 == 2 ? StaticValue.RED_HTML : "#5c5c5c") + "\'>" + (param3 == 2 ? LanResManager.getLanCommonTextWords("(使用)") : LanResManager.getLanCommonTextWords("(未使用)")) + LanResManager.getLanCommonTextWords("神农百草2品") + "</font><br>" + "</textformat>";
               break;
            case 3:
               this.str2 += "<font color=\'" + (param3 == 3 ? StaticValue.RED_HTML : "#5c5c5c") + "\'>" + (param3 == 3 ? LanResManager.getLanCommonTextWords("(使用)") : LanResManager.getLanCommonTextWords("(未使用)")) + LanResManager.getLanCommonTextWords("神农百草3品") + "</font><br>" + "</textformat>";
               break;
            case 4:
               this.str2 += "<font color=\'" + (param3 == 4 ? StaticValue.RED_HTML : "#5c5c5c") + "\'>" + (param3 == 4 ? LanResManager.getLanCommonTextWords("(使用)") : LanResManager.getLanCommonTextWords("(未使用)")) + LanResManager.getLanCommonTextWords("神农百草4品") + "</font><br>" + "</textformat>";
               break;
            case 5:
               this.str2 += "<font color=\'" + (param3 == 5 ? StaticValue.RED_HTML : "#5c5c5c") + "\'>" + (param3 == 5 ? LanResManager.getLanCommonTextWords("(使用)") : LanResManager.getLanCommonTextWords("(未使用)")) + LanResManager.getLanCommonTextWords("神农百草5品") + "</font><br>" + "<br><br><br><br><br><br><br>" + "</textformat>";
               this.setZhanWen(3);
         }
         this.str2 += "<textformat leading=\'6\'>" + "<font color=\'" + (param4 == -1 ? "#5c5c5c" : StaticValue.GREEN_HTML) + "\'>" + LanResManager.getLanCommonTextWords("心法修炼") + "：" + (param4 == -1 ? LanResManager.getLanCommonTextWords("(未激活)") : param4) + LanResManager.getLanCommonTextWords(LanResManager.getLanCommonTextWords("(使用【潜能心法】修炼)")) + "</font><br>";
         if(param4 != -1)
         {
            this.str2 += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("心法加成：攻击") + "+" + (param4 == -1 ? 0 : param4) * 168 + "、" + LanResManager.getLanCommonTextWords("防御") + "+" + (param4 == -1 ? 0 : param4) * 108 + "、" + LanResManager.getLanCommonTextWords("生命") + "+" + (param4 == -1 ? 0 : param4) * 688 + "<br></font>" + "<font color=\'" + (param4 < 100 ? "#5c5c5c" : StaticValue.RED_HTML) + "\'>" + LanResManager.getLanCommonTextWords("心法额外加成：闪避+88、暴击+88") + "</font><br>";
         }
         this.str2 += "</textformat>";
         if(param1 || param3 != 0)
         {
            this.star6 = StaticValue.getBitmapByClassName("ui.char.attribute.long.1");
         }
         else
         {
            this.star6 = StaticValue.getBitmapByClassName("ui.char.attribute.long.0");
         }
         if(param1 && param3 != 0)
         {
            this.star6 = StaticValue.getBitmapByClassName("ui.char.attribute.long.2");
         }
         this.spr2.addChild(this.star6);
      }
      
      public function setZhanWen(param1:int) : void
      {
         var tutengName:String = null;
         var path:String = null;
         var type:int = param1;
         switch(type)
         {
            case 1:
               tutengName = "dugu_qinglong";
               break;
            case 2:
               tutengName = "dugu_zhuque";
               break;
            case 3:
               tutengName = "dugu_baihu";
               break;
            case 4:
               tutengName = "dugu_xuanwu";
         }
         path = ResPathManager.getZhanWenImg(tutengName);
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc3_:Bitmap = null;
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.content != null && _loc2_.url.url == path)
            {
               _loc3_ = _loc2_.content;
               _loc3_.width = 200;
               _loc3_.height = 120;
               zhanWenSpr.addChild(_loc3_);
               zhanWenSpr.x = 15;
               zhanWenSpr.y = 265 - 35;
            }
         },null,false,path);
      }
      
      public function setRouti(param1:Boolean) : void
      {
      }
      
      public function setSiShengShouState(param1:int, param2:int, param3:int, param4:int) : void
      {
         while(this.spr3.numChildren > 0)
         {
            this.spr3.removeChildAt(0);
         }
         this._qinglong = param1;
         this._baihu = param2;
         this._zhuque = param3;
         this._xuanwu = param4;
         if(param1 == 12 || param2 == 12 || param3 == 12 || param4 == 12)
         {
            this.star7 = StaticValue.getBitmapByClassName("ui.char.attribute.sishengshou.1");
         }
         else
         {
            this.star7 = StaticValue.getBitmapByClassName("ui.char.attribute.sishengshou.0");
         }
         this.spr3.addChild(this.star7);
      }
      
      public function setWuhun(param1:int, param2:Boolean, param3:Boolean, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:Boolean = false, param9:int = 0) : void
      {
         var _loc10_:String = null;
         while(this.spr4.numChildren > 0)
         {
            this.spr4.removeChildAt(0);
         }
         this.isNeitishenqi = param8;
         this.neitishenqi = param9;
         if(param1 > 0)
         {
            _loc10_ = param1 < 100 ? LanResManager.getLanCommonTextWords("（可使用武魂丹继续提升）") : "";
            this.str4 = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("武魂值加成") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("武魂值：") + param1 + _loc10_ + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("武魂值越高则为角色带来的属性加成越高") + "</font><br>";
            this.str4 += "</textformat>";
            this.star8 = StaticValue.getBitmapByClassName("ui.char.attribute.wu.1");
            this.spr4.addChild(this.star8);
         }
         else
         {
            _loc10_ = LanResManager.getLanCommonTextWords("（可使用武魂丹提升）");
            this.str4 = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("武魂值加成") + "</font><br>" + "<font color=\'" + StaticValue.SKY_BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("武魂值：") + "0" + _loc10_ + "</font><br>" + "<font color=\'#5c5c5c\'>" + LanResManager.getLanCommonTextWords("武魂值越高则为角色带来的属性加成越高") + "</font><br>";
            this.star8 = StaticValue.getBitmapByClassName("ui.char.attribute.wu.0");
            this.spr4.addChild(this.star8);
         }
         if(param3)
         {
            this.str4 += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("火魂丹(已使用)") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("武魂神丹使用个数：") + param4 + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("累计增加攻击：") + 200000 * 5 * param4 + LanResManager.getLanCommonTextWords("防御：") + 200000 * 5 * param4 + LanResManager.getLanCommonTextWords("战斗力：") + 20000 * 5 * param4 + LanResManager.getLanCommonTextWords("武功层数：") + 10 * param4 + "</font><br>" + "</textformat>";
         }
         else
         {
            this.str4 += "<font color=\'#5c5c5c\'>" + LanResManager.getLanCommonTextWords("火魂丹(未使用)") + "</font><br>" + "<font color=\'#5c5c5c\'>" + LanResManager.getLanCommonTextWords("武魂神丹使用个数：0(开启火魂丹后可通过武魂神丹提升)") + "</font><br>" + "</textformat>";
         }
         if(param5)
         {
            this.str4 += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("龙魂武魄(已使用)") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("龙魂神丹使用个数：") + param6 + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("累计增加攻击：") + 2000000 * param6 + LanResManager.getLanCommonTextWords("亿武功层数：") + 15 * param6 + LanResManager.getLanCommonTextWords("战斗力：") + 150000 * param6 + LanResManager.getLanCommonTextWords("防御：") + 2000000 * param6 + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活龙魂武魄属性再使用1000颗后将激活龙魂武魄超强技能——封龙决") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("封龙决（特殊技能）：攻击时，有几率触发封龙决，封印对手的降龙十八掌技能，") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("使其在15秒内无法使用降龙十八掌及时降龙的所有属性。") + "</font><br>" + "</textformat>";
         }
         else
         {
            this.str4 += "<font color=\'#5c5c5c\'>" + LanResManager.getLanCommonTextWords("龙魂武魄(未使用)") + "</font><br>" + "<font color=\'#5c5c5c\'>" + LanResManager.getLanCommonTextWords("龙魂神丹使用个数：0(开启龙魂武魄后可通过龙魂神丹提升)") + "</font><br>" + "<font color=\'#5c5c5c\'>" + LanResManager.getLanCommonTextWords("激活龙魂武魄属性再使用1000颗后将激活龙魂武魄超强技能——封龙决") + "</font><br>" + "<font color=\'#5c5c5c\'>" + LanResManager.getLanCommonTextWords("封龙决（特殊技能）：攻击时，有几率触发封龙决，封印对手的降龙十八掌技能，") + "</font><br>" + "<font color=\'#5c5c5c\'>" + LanResManager.getLanCommonTextWords("使其在15秒内无法使用降龙十八掌及时降龙的所有属性。") + "</font><br>" + "</textformat>";
         }
         if(this.isMainChar)
         {
            this.tianmopo = GameState.dictMainStatus[727588];
            this.tianmodan = GameState.dictMainStatus[727589];
         }
         else
         {
            this.tianmopo = GameState.dictTargetStatus[727588];
            this.tianmodan = GameState.dictTargetStatus[727589];
         }
         this.str4 += "<font color=\'" + (this.tianmopo ? StaticValue.ORANGE_HTML : StaticValue.BLUE_HTML) + "\'>" + LanResManager.getLanCommonTextWords("天魔魄：") + "</font><font color=\'" + (this.tianmopo ? StaticValue.GREEN_HTML : StaticValue.BLUE_HTML) + "\'>" + (this.tianmopo ? LanResManager.getLanCommonTextWords("【已激活】") : LanResManager.getLanCommonTextWords("【未激活】")) + "</font><br>" + "<font color=\'" + (this.tianmopo ? StaticValue.ORANGE_HTML : "#5c5c5c") + "\'>" + LanResManager.getLanCommonTextWords("天魔丹已使用：") + this.tianmodan + "/1000" + "<br>" + "</font>" + LanResManager.getLanCommonTextWords("属性加成：") + "</font>" + "    " + LanResManager.getLanCommonTextWords("攻击：") + this.tianmodan * 40000000 + "</font>" + "    " + LanResManager.getLanCommonTextWords("防御：") + this.tianmodan * 40000000 + "</font>" + "    " + LanResManager.getLanCommonTextWords("武功层数:") + this.tianmodan * 300 + "</font>" + "    " + LanResManager.getLanCommonTextWords("战斗力：") + this.tianmodan * 3000000 + "</font>" + "</textformat>";
      }
      
      public function setHuXinYao(param1:Boolean) : void
      {
         this._isHunXinYao = param1;
      }
      
      public function setNiXi(param1:Boolean) : void
      {
         this._niXiSta = param1;
      }
      
      public function setFengHuang(param1:Boolean) : void
      {
         this._fengHuangSta = param1;
      }
   }
}

