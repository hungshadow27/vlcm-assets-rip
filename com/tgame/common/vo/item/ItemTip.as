package com.tgame.common.vo.item
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.panel.FCanvas;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.TextManager;
   import com.zcp.common.draw.helper.DrawHelper;
   import com.zcp.common.utils.Fun;
   import com.zcp.common.vo.StyleData;
   import com.zcp.loader.DobjLoadManager;
   import com.zcp.loader.loader.DobjLoader;
   import com.zcp.loader.vo.LoadData_new;
   import com.zcp.manager.LoaderManager;
   import com.zcp.manager.RslLoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class ItemTip
   {
      
      public static var fightAttr:Object;
      
      public static var chuanshuoAttr:Object;
      
      public static var tutengAttr:Object;
      
      public static var fightAttr2:Object;
      
      public static var fightAttr3:Object;
      
      public static var equipAttr4:Object;
      
      private var _showContainer:Sprite;
      
      private var _bigICOSpr:Sprite;
      
      private var _baoshiICOSpr:Sprite;
      
      private var canvas:FCanvas;
      
      private var paddingY:Number = 18;
      
      private var dataXML:XML;
      
      private var lineBD:BitmapData;
      
      private var longSpr:Sprite;
      
      private var longJinduSpr:Sprite;
      
      private var donghuaMC:MovieClip;
      
      private var rLum:Number = 0.2225;
      
      private var gLum:Number = 0.5169;
      
      private var bLum:Number = 0.0606;
      
      private var bwMatrix:Array = [this.rLum,this.gLum,this.bLum,0,0,this.rLum,this.gLum,this.bLum,0,0,this.rLum,this.gLum,this.bLum,0,0,0,0,0,1,0];
      
      private var yanse:Array = ["hong","cheng","huang","lv","qing","lan","zi"];
      
      public function ItemTip()
      {
         super();
         this._showContainer = new Sprite();
         this._bigICOSpr = new Sprite();
         this._baoshiICOSpr = new Sprite();
         this.longSpr = new Sprite();
         this.longJinduSpr = new Sprite();
         this.canvas = new FCanvas();
         this.canvas.mouseChildren = false;
         this.canvas.mouseEnabled = false;
         this.canvas.skin = "backGroud";
         this._showContainer.x = 10;
         this._showContainer.y = 10;
         this.lineBD = StaticValue.getBitmapByClassName("ui.line").bitmapData;
      }
      
      public static function init() : void
      {
         fightAttr = {
            "a1":LanResManager.getLanCommonTextWords("攻击"),
            "a2":LanResManager.getLanCommonTextWords("防御"),
            "a3":LanResManager.getLanCommonTextWords("暴击"),
            "a4":LanResManager.getLanCommonTextWords("闪避"),
            "a5":LanResManager.getLanCommonTextWords("生命值上限"),
            "a6":LanResManager.getLanCommonTextWords("体力值上限"),
            "a7":LanResManager.getLanCommonTextWords("内力上限"),
            "a8":LanResManager.getLanCommonTextWords("攻击速度"),
            "a9":LanResManager.getLanCommonTextWords("移动速度"),
            "a10":LanResManager.getLanCommonTextWords("命中"),
            "a20":LanResManager.getLanCommonTextWords("青龙战纹"),
            "a21":LanResManager.getLanCommonTextWords("朱雀战纹"),
            "a22":LanResManager.getLanCommonTextWords("白虎战纹"),
            "a23":LanResManager.getLanCommonTextWords("玄武战纹"),
            "a25":LanResManager.getLanCommonTextWords("爆击免伤比例"),
            "a31":LanResManager.getLanCommonTextWords("抵抗暗器几率比例"),
            "a32":LanResManager.getLanCommonTextWords("暗器免伤比例"),
            "a33":LanResManager.getLanCommonTextWords("抵抗弓箭比例"),
            "a34":LanResManager.getLanCommonTextWords("抵抗丹田比例"),
            "a47":LanResManager.getLanCommonTextWords("抵抗暴击伤害几率"),
            "a48":LanResManager.getLanCommonTextWords("被攻击时有几率触发狂暴技能（3秒内增加人物攻击伤害30%）"),
            "a49":LanResManager.getLanCommonTextWords("武功层数"),
            "a50":LanResManager.getLanCommonTextWords("防御"),
            "a51":LanResManager.getLanCommonTextWords("血量"),
            "a52":LanResManager.getLanCommonTextWords("有几率在受到对手攻击时将伤害转化为补血效果"),
            "a53":LanResManager.getLanCommonTextWords("战斗力"),
            "a57":LanResManager.getLanCommonTextWords("武防"),
            "a58":LanResManager.getLanCommonTextWords("提升破甲"),
            "a59":LanResManager.getLanCommonTextWords("提升格挡"),
            "a60":LanResManager.getLanCommonTextWords("提升命中")
         };
         chuanshuoAttr = {
            "a1":LanResManager.getLanCommonTextWords("攻击"),
            "a2":LanResManager.getLanCommonTextWords("防御"),
            "a5":LanResManager.getLanCommonTextWords("血量"),
            "a6":LanResManager.getLanCommonTextWords("体力"),
            "a7":LanResManager.getLanCommonTextWords("内力")
         };
         tutengAttr = {
            "a20":LanResManager.getLanCommonTextWords("攻击力增强"),
            "a21":LanResManager.getLanCommonTextWords("反弹伤害"),
            "a22":LanResManager.getLanCommonTextWords("忽视防御"),
            "a23":LanResManager.getLanCommonTextWords("伤害减免"),
            "a24":LanResManager.getLanCommonTextWords("暗器免伤")
         };
         fightAttr2 = {
            "a47":47,
            "a20":20,
            "a21":21,
            "a22":22,
            "a23":23,
            "a50":50,
            "a51":51
         };
         fightAttr3 = {
            "a48":48,
            "a52":52
         };
         equipAttr4 = {
            "a0":LanResManager.getLanCommonTextWords("轩辕佩剑"),
            "a1":LanResManager.getLanCommonTextWords("轩辕神甲"),
            "a2":LanResManager.getLanCommonTextWords("轩辕戒指"),
            "a3":LanResManager.getLanCommonTextWords("轩辕金印")
         };
      }
      
      public function getItemTip(param1:XML) : Sprite
      {
         var _loc2_:int = 0;
         var _loc5_:XML = null;
         this.dataXML = param1;
         var _loc3_:XMLList = param1.children();
         var _loc4_:int = _loc3_.length();
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            _loc5_ = _loc3_[_loc2_];
            this.showSingleData(_loc5_,_loc2_);
            _loc2_++;
         }
         this.canvas.width = this._showContainer.width + 20;
         this.canvas.height = this._showContainer.height + 20;
         this.canvas.addChild(this.longSpr);
         this.canvas.addChild(this.longJinduSpr);
         this.canvas.addChild(this._showContainer);
         this.canvas.addChild(this._bigICOSpr);
         this.canvas.addChild(this._baoshiICOSpr);
         if(this._showContainer.height <= this._bigICOSpr.height)
         {
            this.canvas.height += this._bigICOSpr.height - 30;
         }
         return this.canvas;
      }
      
      private function showSingleData(param1:XML, param2:int) : void
      {
         var id:String;
         var tag:String;
         var longwenkehuaArr:Array;
         var bp:Bitmap = null;
         var isLine:Boolean = false;
         var isAddBaoShi:Boolean = false;
         var isAddDongHua:Boolean = false;
         var isAddZhanWenMask:Boolean = false;
         var donghuaID:String = null;
         var tutengID:int = 0;
         var tutengPercent:Number = NaN;
         var isLongWenMask:Boolean = false;
         var textFormat:TextFormat = null;
         var str:String = null;
         var xmlList:XMLList = null;
         var i:int = 0;
         var len:int = 0;
         var bigICO:Sprite = null;
         var path:String = null;
         var oldTF:TextField = null;
         var singleXML:XML = null;
         var taoZhuang:XML = null;
         var nameAdd:XML = null;
         var color:String = null;
         var goodRes:GoodsRes = null;
         var bm:Bitmap = null;
         var star:Sprite = null;
         var tutengTF:TextField = null;
         var menghua:String = null;
         var bd:BitmapData = null;
         var diamondBP:Bitmap = null;
         var tf2:TextField = null;
         var w:int = 0;
         var $singleData:XML = param1;
         var $i:int = param2;
         var longwenjindu:String = "";
         var tf:TextField = new TextField();
         textFormat = new TextFormat();
         textFormat.leading = 3;
         textFormat.align = TextFormatAlign.LEFT;
         tf.wordWrap = true;
         tf.multiline = true;
         tf.width = 280;
         id = $singleData.@id;
         tag = $singleData.@tag;
         longwenkehuaArr = [];
         if(id == "4")
         {
            textFormat.align = TextFormatAlign.CENTER;
            textFormat.bold = true;
            str = "";
            singleXML = this.findSingleXML("501");
            taoZhuang = this.findSingleXML("999");
            nameAdd = this.findSingleXML("997");
            color = $singleData.@color;
            if(nameAdd != null)
            {
               color = "#ff0000";
               str += "<font size=\'14\' color=\'" + color + "\'>" + TextManager.getXMLText(nameAdd.@txt) + "</font>";
            }
            if(taoZhuang != null)
            {
               str += "<font size=\'14\' color=\'" + color + "\'>" + TextManager.getXMLText(taoZhuang.@txt) + "</font>";
            }
            str += "<font size=\'14\' color=\'" + color + "\'>" + TextManager.getXMLText($singleData.@txt) + "</font>";
            if(singleXML != null)
            {
               str += "<font size=\'14\' color=\'" + "#828282" + "\'>" + "[" + LanResManager.getLanCommonTextWords("已装备") + "]</font>";
            }
            tf.htmlText = str;
         }
         else if(id != "501")
         {
            if(id != "999")
            {
               if(id != "997")
               {
                  if(id == "5")
                  {
                     tf.htmlText = "<font face=\'" + (LanResManager.getLanFont("com.tgame.common.vo.item::ItemTip#宋体") || "") + "\' color=\'" + $singleData.@color + "\'>" + $singleData.@txt + "</font>";
                     bp = new Bitmap(this.lineBD);
                     bp.width = 270;
                     isLine = true;
                  }
                  else if(id == "1007")
                  {
                     isAddDongHua = true;
                     donghuaID = $singleData.@donghua;
                     oldTF = this.getTF("5");
                  }
                  else if(id == "255")
                  {
                     bigICO = new Sprite();
                     DrawHelper.drawRect(bigICO,new Point(0,0),new Point(66,66),new StyleData(0,3821918,1,0,1));
                     bigICO.width = 65;
                     bigICO.height = 65;
                     bigICO.x = 220;
                     bigICO.y = 40;
                     path = ResPathManager.getBigICOPath(Number($singleData.@txt));
                     LoaderManager.lazyLoad(function(param1:Event):void
                     {
                        var _loc2_:LoadingItem = param1.target as LoadingItem;
                        if(_loc2_.content != null && _loc2_.url.url == path)
                        {
                           _loc2_.content.x = 1;
                           _loc2_.content.y = 1;
                           _loc2_.content.width = 65;
                           _loc2_.content.height = 65;
                           bigICO.addChild(_loc2_.content);
                        }
                     },null,false,path);
                     this._bigICOSpr.addChild(bigICO);
                  }
                  else if(id == "251")
                  {
                     str = "<font face=\'" + (LanResManager.getLanFont("com.tgame.common.vo.item::ItemTip#宋体") || "") + "\' color=\'" + $singleData.@color + "\'>" + TextManager.getXMLText($singleData.@txt) + "</font>";
                     xmlList = $singleData.children();
                     len = xmlList.length();
                     i = 0;
                     while(i < len)
                     {
                        str += "<font face=\'" + (LanResManager.getLanFont("com.tgame.common.vo.item::ItemTip#宋体") || "") + "\' color=\'" + xmlList[i].@color + "\'>" + xmlList[i].@txt + "</font>";
                        i++;
                     }
                     tf.htmlText = str;
                  }
                  else if(tag == "253" || tag == "265")
                  {
                     bigICO = new Sprite();
                     bigICO.y += this._showContainer.height;
                     bigICO.x = 13;
                     goodRes = GoodsResManager.getGoodsRes(Number($singleData.@modelID));
                     bm = new Goods(goodRes.id_kind).getSmallICO(20,20);
                     bigICO.addChild(bm);
                     isAddBaoShi = true;
                     if(tag == "265")
                     {
                        tf.htmlText = "<font face=\'" + (LanResManager.getLanFont("com.tgame.common.vo.item::ItemTip#宋体") || "") + "\' color=\'" + $singleData.@color + "\'>       " + TextManager.getXMLText($singleData.@txt) + " </font>";
                     }
                     else
                     {
                        tf.htmlText = "<font face=\'" + (LanResManager.getLanFont("com.tgame.common.vo.item::ItemTip#宋体") || "") + "\' color=\'" + $singleData.@color + "\'>    " + TextManager.getXMLText($singleData.@txt) + "</font>";
                     }
                  }
                  else if(id == "256")
                  {
                     star = this.createStar($singleData);
                     star.y = this._showContainer.height;
                     this._showContainer.addChild(star);
                  }
                  else if(id == "267")
                  {
                     textFormat = new TextFormat();
                     textFormat.leading = 3;
                     textFormat.align = TextFormatAlign.RIGHT;
                     xmlList = $singleData.children();
                     len = xmlList.length();
                     oldTF = this.getTF("252");
                     i = 0;
                     while(i < len)
                     {
                        tutengTF = new TextField();
                        menghua = xmlList[i].@menghuan;
                        if(menghua == "1")
                        {
                           str = "<font face=\'" + (LanResManager.getLanFont("com.tgame.common.vo.item::ItemTip#宋体") || "") + "\' color=\'" + StaticValue.ORANGE_HTML + "\'>" + "【" + LanResManager.getLanCommonTextWords("梦幻满值") + "】" + "</font>";
                        }
                        else
                        {
                           str = "<font face=\'" + (LanResManager.getLanFont("com.tgame.common.vo.item::ItemTip#宋体") || "") + "\' color=\'" + "#068A00" + "\'>" + xmlList[i].@txt + "</font>";
                        }
                        tutengTF.htmlText = str;
                        tutengTF.y = oldTF.y + oldTF.height + i * oldTF.height;
                        tutengTF.x = 180;
                        tutengTF.height = 30;
                        tutengTF.setTextFormat(textFormat);
                        this._showContainer.addChild(tutengTF);
                        i++;
                     }
                  }
                  else if(tag == "87")
                  {
                     oldTF = this.getTF("88");
                     if(oldTF)
                     {
                        bd = RslLoaderManager.getInstance("ui.equip.ico.diamond");
                        diamondBP = new Bitmap(bd);
                        if($singleData.@type == "1")
                        {
                           diamondBP.filters = null;
                        }
                        else
                        {
                           diamondBP.filters = Tools.blackWhiteFilter;
                        }
                        diamondBP.y = oldTF.y;
                        diamondBP.x = oldTF.textWidth;
                        this._showContainer.addChild(diamondBP);
                        if($singleData.@is11Star == "1")
                        {
                           diamondBP = new Bitmap(bd);
                           diamondBP.y = oldTF.y;
                           diamondBP.x = oldTF.textWidth + 10;
                           this._showContainer.addChild(diamondBP);
                           tf2 = new TextField();
                           tf2.width = 150;
                           tf2.height = 25;
                           tf2.htmlText = "<font face=\'" + (LanResManager.getLanFont("com.tgame.common.vo.item::ItemTip#宋体") || "") + "\' color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("千锤百炼额外加一星") + "</font>";
                           tf2.x = diamondBP.x + 10;
                           tf2.y = diamondBP.y;
                           this._showContainer.addChild(tf2);
                        }
                     }
                  }
                  else if(tag == "88")
                  {
                     oldTF = this.getTF("2531");
                     if(oldTF)
                     {
                        bd = RslLoaderManager.getInstance("ui.equip.ico.diamond.gold");
                        diamondBP = new Bitmap(bd);
                        if($singleData.@type == "1")
                        {
                           diamondBP.filters = null;
                        }
                        else
                        {
                           diamondBP.filters = Tools.blackWhiteFilter;
                        }
                        diamondBP.y = oldTF.y;
                        diamondBP.x = oldTF.textWidth;
                        this._showContainer.addChild(diamondBP);
                     }
                  }
                  else if(id == "268")
                  {
                     tf.htmlText = "<font face=\'" + (LanResManager.getLanFont("com.tgame.common.vo.item::ItemTip#宋体") || "") + "\' color=\'" + $singleData.@color + "\'>" + TextManager.getXMLText($singleData.@txt) + "</font><font color=\'" + StaticValue.BlUE50_HTML + "\'>" + TextManager.getXMLText($singleData.@txt1) + "</font>";
                  }
                  else if(id == "2681")
                  {
                     isAddZhanWenMask = true;
                     tutengID = int($singleData.@tutengID);
                     tutengPercent = Number($singleData.@tutengPercent);
                     oldTF = this.getTF("268");
                  }
                  else if(id == "1005")
                  {
                     isLongWenMask = true;
                     longwenjindu = $singleData.@jindu;
                  }
                  else if(tag == "fujia")
                  {
                     textFormat.leading = -1;
                     if($singleData.@menghuan == "1")
                     {
                        str = "<font face=\'" + (LanResManager.getLanFont("com.tgame.common.vo.item::ItemTip#宋体") || "") + "\' color=\'" + $singleData.@color + "\'>" + TextManager.getXMLText($singleData.@txt) + "</font>" + "  <font face=\'" + (LanResManager.getLanFont("com.tgame.common.vo.item::ItemTip#宋体") || "") + "\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + TextManager.getXMLText($singleData.@append) + "</font>" + "  <font face=\'" + (LanResManager.getLanFont("com.tgame.common.vo.item::ItemTip#宋体") || "") + "\' color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + TextManager.getXMLText("【" + LanResManager.getLanCommonTextWords("梦幻满值") + "】") + "</font>";
                     }
                     else
                     {
                        str = "<font face=\'" + (LanResManager.getLanFont("com.tgame.common.vo.item::ItemTip#宋体") || "") + "\' color=\'" + $singleData.@color + "\'>" + TextManager.getXMLText($singleData.@txt) + "</font>" + "  <font face=\'" + (LanResManager.getLanFont("com.tgame.common.vo.item::ItemTip#宋体") || "") + "\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + TextManager.getXMLText($singleData.@append) + "</font>" + "  <font face=\'" + (LanResManager.getLanFont("com.tgame.common.vo.item::ItemTip#宋体") || "") + "\' color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + TextManager.getXMLText($singleData.@max) + "</font>";
                     }
                     tf.htmlText = str;
                  }
                  else
                  {
                     tf.htmlText = "<font face=\'" + (LanResManager.getLanFont("com.tgame.common.vo.item::ItemTip#宋体") || "") + "\' color=\'" + $singleData.@color + "\'>" + TextManager.getXMLText($singleData.@txt) + "</font>";
                     w = Number($singleData.@width);
                     if(w != 0)
                     {
                        tf.width = w;
                     }
                  }
               }
            }
         }
         tf.setTextFormat(textFormat);
         if($i != 0)
         {
            tf.y += this._showContainer.height;
         }
         tf.height = tf.textHeight + 4;
         if(isAddBaoShi)
         {
            this._showContainer.addChild(bigICO);
         }
         if(isAddDongHua)
         {
            this.showDongHua(oldTF,donghuaID);
         }
         if(isAddZhanWenMask)
         {
            this.showZhanWenMask(oldTF,tutengID,tutengPercent);
         }
         if(isLine)
         {
            if(this._showContainer.height > 103)
            {
               tf.y = this._showContainer.height;
            }
            else
            {
               tf.y = 103;
            }
            bp.y = tf.y + tf.height + 5;
            this._showContainer.addChild(bp);
         }
         tf.name = id;
         this._showContainer.addChild(tf);
         if(isLongWenMask)
         {
            this.showLongWenMask(longwenjindu);
         }
      }
      
      private function showDongHua(param1:TextField, param2:String) : void
      {
         var bigICO:Sprite = null;
         var path:String = null;
         var $tf:TextField = param1;
         var $donghuaID:String = param2;
         bigICO = new Sprite();
         var dh:String = $donghuaID;
         path = GameConfig.fileBaseFolder + "res/data/mc/donghua/" + dh + ".swf";
         if(Boolean(this.donghuaMC) && Boolean(this.donghuaMC.parent))
         {
            this.donghuaMC.parent.removeChild(this.donghuaMC);
            this.donghuaMC = null;
         }
         if(dh.length > 0)
         {
            this.addBlankLine();
            this.addBlankLine();
            this.addBlankLine();
            this.addBlankLine();
            this.addBlankLine();
            this.addBlankLine();
            this.addBlankLine();
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc3_:MovieClip = null;
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.content != null && _loc2_.url.url == path)
               {
                  _loc3_ = _loc2_.content as MovieClip;
                  _loc3_.x = 1;
                  _loc3_.y = 1;
                  bigICO.addChild(_loc3_);
                  bigICO.y = $tf.y + $tf.height + 10;
                  bigICO.x = -9;
                  _showContainer.addChild(bigICO);
               }
            },null,false,path);
            this.addBlankLine();
         }
      }
      
      private function showZhanWenMask(param1:TextField, param2:int, param3:Number) : void
      {
         var bigICO:Sprite = null;
         var tutengName:String = null;
         var path:String = null;
         var $tf:TextField = param1;
         var $tutengID:int = param2;
         var $tutengPercent:Number = param3;
         this.addBlankLine();
         this.addBlankLine();
         this.addBlankLine();
         this.addBlankLine();
         this.addBlankLine();
         this.addBlankLine();
         this.addBlankLine();
         bigICO = new Sprite();
         switch($tutengID)
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
            var _loc4_:int = 0;
            var _loc5_:Number = NaN;
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.content != null && _loc2_.url.url == path)
            {
               _loc3_ = _loc2_.content;
               _loc4_ = _showContainer.width;
               _loc3_.x = 10;
               _loc3_.y = 1;
               _loc3_.width = _loc4_;
               _loc3_.height = 133;
               _loc5_ = _loc4_ * $tutengPercent;
               _loc3_.bitmapData.applyFilter(_loc3_.bitmapData,new Rectangle(_loc5_,0,500,500),new Point(_loc5_,0),new ColorMatrixFilter(bwMatrix));
               bigICO.addChild(_loc3_);
               bigICO.y = $tf.y + 40;
               bigICO.x -= 10;
               _showContainer.addChild(bigICO);
            }
         },null,false,path);
      }
      
      private function showLongWenMask(param1:String) : void
      {
         var arr:Array;
         var i:int;
         var loadComplete:Function = null;
         var b:Sprite = null;
         var jindu:String = param1;
         loadComplete = function(param1:LoadData_new, param2:Event):void
         {
            var _loc3_:Bitmap = (param2.target as DobjLoader).content as Bitmap;
            if(_loc3_)
            {
               Fun.clearChildren(longSpr);
               longSpr.addChild(_loc3_);
               longSpr.x = -40;
               longSpr.y = -160;
            }
         };
         var loadUrl:String = GameConfig.fileBaseFolder + "res/ui/longwenkehua/long.png";
         var ld:LoadData_new = new LoadData_new(loadUrl,loadComplete);
         DobjLoadManager.load(ld);
         arr = [];
         arr = jindu.split(";");
         arr.pop();
         Fun.clearChildren(this.longJinduSpr);
         i = 0;
         while(i < arr.length)
         {
            b = this.createRemoteICO(GameConfig.fileBaseFolder + "res/ui/longwenkehua/" + this.yanse[int([arr[i]])] + ".png");
            b.x = 17 + i * 28;
            b.y = -30;
            this.longJinduSpr.addChild(b);
            i++;
         }
      }
      
      private function addBlankLine() : void
      {
         this.showSingleData(XML("<row txt=\'" + "  " + "\' color=\'" + StaticValue.GREEN_HTML + "\' />"),99);
      }
      
      private function findSingleXML(param1:String) : XML
      {
         var _loc2_:int = 0;
         var _loc5_:XML = null;
         var _loc6_:String = null;
         var _loc3_:XMLList = this.dataXML.children();
         var _loc4_:int = _loc3_.length();
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            _loc5_ = _loc3_[_loc2_];
            _loc6_ = _loc5_.@id;
            if(_loc6_ == param1)
            {
               return _loc5_;
            }
            _loc2_++;
         }
         return null;
      }
      
      private function createStar(param1:XML) : Sprite
      {
         var _loc3_:Bitmap = null;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc2_:Sprite = new Sprite();
         var _loc4_:String = param1.@value;
         if(_loc4_ != "")
         {
            _loc5_ = _loc4_.split(",");
            _loc6_ = int(_loc5_.length);
            while(_loc7_ < _loc6_)
            {
               if(_loc5_[_loc7_] == "1")
               {
                  _loc3_ = this.createLocalICO("itemtip.s2");
                  _loc3_.x += _loc7_ * 15;
               }
               else
               {
                  _loc3_ = this.createLocalICO("itemtip.s1");
                  _loc3_.x += _loc7_ * 15;
               }
               _loc2_.addChild(_loc3_);
               _loc7_++;
            }
         }
         if(param1.@is11Star == "1")
         {
            _loc3_ = this.createLocalICO("ui.equip.ico.diamond");
            _loc3_.x += _loc7_ * 15;
            _loc2_.addChild(_loc3_);
         }
         return _loc2_;
      }
      
      private function createLocalICO(param1:String) : Bitmap
      {
         var _loc2_:BitmapData = RslLoaderManager.getInstance(param1,10,10) as BitmapData;
         return new Bitmap(_loc2_);
      }
      
      private function createRemoteICO(param1:String) : Sprite
      {
         var spr:Sprite = null;
         var $id:String = param1;
         spr = new Sprite();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            spr.addChild(_loc2_.content);
         },null,false,$id);
         return spr;
      }
      
      private function getTF(param1:String) : TextField
      {
         return this._showContainer.getChildByName(param1) as TextField;
      }
      
      public function clear() : void
      {
         Fun.clearChildren(this._showContainer);
      }
   }
}

