package com.tgame.shell.view.components.huodong
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class HuyiKaiguangPanel extends FPanel
   {
      
      public static const UI_HUYIKAIGUANG_OK_CLICK:String = "UI_HUYIKAIGUANG_OK_CLICK";
      
      public static const UI_LONGYINKAIGUANG_OK_CLICK:String = "UI_LONGYINKAIGUANG_OK_CLICK";
      
      public static const UI_LONGYA_OK_CLICK:String = "UI_LONGYA_OK_CLICK";
      
      private var ft:FTextArea;
      
      private var ft2:FTextArea;
      
      private var ft3:FTextArea;
      
      private var ft1:FTextArea;
      
      private var bg:Bitmap;
      
      private var imgIco:DisplayObject;
      
      private var btn:SecondButton;
      
      private var fc:FCanvas;
      
      private var line:Bitmap;
      
      private var item:ItemFace;
      
      private var strName:String;
      
      private var goods:Goods;
      
      private var item2:ItemFace;
      
      private var strName2:String;
      
      private var goods2:Goods;
      
      private var biaoshi:int;
      
      private var sprite:Sprite;
      
      private var itemArr:Array;
      
      private var itemTextArr:Array;
      
      private var itemFaceArr:Array;
      
      public function HuyiKaiguangPanel()
      {
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 460;
         height = 300;
         titleText = LanResManager.getLanCommonTextWords("开光");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.sprite = new Sprite();
         addChild(this.sprite);
         this.itemArr = new Array();
         this.itemTextArr = new Array();
         this.itemFaceArr = new Array();
         this.ft = new FTextArea();
         with(this.ft)
         {
            width = 450;
            height = 100;
            x = 15;
            y = 7;
            filters = StaticValue.filter;
            textColor = StaticValue.SKY_BLUE;
            htmlText = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.GOLD_HTML + "\'>" + LanResManager.getLanCommonTextWords("虎翼本属上古邪兵之列，曾被神器击碎散落于世，自此销声匿迹于世。") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("后人机缘巧合之下重铸虎翼，但其展现其的实力却大不如前！") + "</font><br>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("传说通过开光灵石便能让虎翼重新觉醒为神兵，大展远古神兵之威！") + "</font>" + "</textformat>";
         }
         addChild(this.ft);
         this.fc = new FCanvas();
         this.fc.x = 10;
         this.fc.y = 60;
         this.fc.width = 441;
         this.fc.height = 196;
         this.fc.skin = "box_transparence";
         addChild(this.fc);
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            width = 200;
            autoSize = TextFieldAutoSize.LEFT;
            x = 20;
            y = 64;
            filters = StaticValue.filter;
            textColor = StaticValue.SKY_BLUE;
            htmlText = "";
         }
         addChild(this.ft1);
         this.btn = new SecondButton();
         this.btn.label = LanResManager.getLanCommonTextWords("开光");
         addChild(this.btn);
         this.btn.x = 308;
         this.btn.y = 165 + 15;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function setItem(param1:int) : void
      {
         var obj:FTextArea = null;
         var obj2:Bitmap = null;
         var obj3:ItemFace = null;
         var posionArr:Array = null;
         var po:int = 0;
         var ft2:FTextArea = null;
         var item:Bitmap = null;
         var num:int = param1;
         for each(obj in this.itemTextArr)
         {
            if(contains(obj))
            {
               removeChild(obj);
            }
         }
         this.itemTextArr.length = 0;
         for each(obj2 in this.itemArr)
         {
            if(contains(obj2))
            {
               removeChild(obj2);
            }
         }
         this.itemArr.length = 0;
         for each(obj3 in this.itemFaceArr)
         {
            if(contains(obj3))
            {
               removeChild(obj3);
            }
         }
         this.itemFaceArr.length = 0;
         posionArr = [];
         if(num == 1)
         {
            posionArr = [305];
         }
         else if(num == 2)
         {
            posionArr = [270 - 25,360 - 25];
         }
         else if(num == 3)
         {
            posionArr = [251,305,359];
         }
         for each(po in posionArr)
         {
            ft2 = new FTextArea();
            with(ft2)
            {
               
               autoSize = TextFieldAutoSize.LEFT;
               x = po;
               y = 100 + 15;
               filters = StaticValue.filter;
               textColor = StaticValue.YELLOW;
               htmlText = "";
            }
            addChild(ft2);
            this.itemTextArr.push(ft2);
            item = StaticValue.getBitmapByClassName("ui.tiem.slot");
            addChild(item);
            item.x = po;
            item.y = 120 + 15;
            this.itemArr.push(item);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn:
               if(this.biaoshi == 1)
               {
                  dispatchEvent(new BaseEvent(UI_HUYIKAIGUANG_OK_CLICK));
               }
               else if(this.biaoshi == 2)
               {
                  dispatchEvent(new BaseEvent(UI_LONGYINKAIGUANG_OK_CLICK));
               }
               else
               {
                  dispatchEvent(new BaseEvent(UI_LONGYA_OK_CLICK));
               }
         }
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setInitialize(param1:Goods, param2:int, param3:Goods, param4:int) : void
      {
         var str:String;
         var go:Goods = param1;
         var int1:int = param2;
         var go2:Goods = param3;
         var int2:int = param4;
         if(this.ft != null && this.ft.parent != null)
         {
            this.ft.parent.removeChildAt(0);
         }
         this.ft = new FTextArea();
         with(this.ft)
         {
            width = 400;
            height = 50;
            x = 15;
            y = 7;
            filters = StaticValue.filter;
            textColor = StaticValue.SKY_BLUE;
            htmlText = "<textformat leading=\'4\'>" + "<font color=\'" + StaticValue.GOLD_HTML + "\'>" + LanResManager.getLanCommonTextWords("虎翼本属上古邪兵之列，曾被神器击碎散落于世，自此销声匿迹于世。") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("后人机缘巧合之下重铸虎翼，但其展现其的实力却大不如前！") + "</font><br>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("传说通过开光灵石便能让虎翼重新觉醒为神兵，大展远古神兵之威！") + "</font>" + "</textformat>";
         }
         this.sprite.addChild(this.ft);
         this.biaoshi = 1;
         this.setItem(2);
         this.strName = go.res.name;
         this.itemTextArr[0].htmlText = this.strName;
         this.item = new ItemFace(go);
         this.item.x = 272 - 25;
         this.item.y = 122 + 15;
         addChild(this.item);
         if(go.count <= 0)
         {
            this.item.filters = Tools.blackWhiteFilter;
         }
         this.itemFaceArr.push(this.item);
         this.strName2 = go2.res.name;
         this.itemTextArr[1].htmlText = this.strName2;
         this.goods2 = go2;
         this.item2 = new ItemFace(go2);
         this.item2.x = 342 + 20 - 25;
         this.item2.y = 122 + 15;
         addChild(this.item2);
         if(go2.count <= 0)
         {
            this.item2.filters = Tools.blackWhiteFilter;
         }
         this.itemFaceArr.push(this.item2);
         str = "";
         str = "<textformat leading=\'4\'>";
         str += "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活条件：") + "<br></font>";
         str += "<font color=\'" + StaticValue.WHITE_HTML + "\'>    " + LanResManager.getLanCommonTextWords("拥有虎翼神兵") + "<br></font>";
         str += "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("隐藏属性激活后加成：") + "<br></font>";
         str += "<font color=\'" + StaticValue.WHITE_HTML + "\'>    " + LanResManager.getLanCommonTextWords("攻击：6500，血量上限：100000") + "<br></font>";
         str += "<font color=\'" + StaticValue.WHITE_HTML + "\'>    " + LanResManager.getLanCommonTextWords("所有武功层数增加2层") + "<br></font>";
         str += "<font color=\'" + StaticValue.WHITE_HTML + "\'>    " + LanResManager.getLanCommonTextWords("减少50%被击落下坐骑的几率") + "<br></font>";
         str += "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活将消耗：") + "<br></font>";
         if(go.count >= int1)
         {
            str += "<font color=\'" + StaticValue.GREEN_HTML + "\'>    " + this.strName + int1 + LanResManager.getLanCommonTextWords("颗") + "," + "</font>";
         }
         else
         {
            str += "<font color=\'" + StaticValue.RED_HTML + "\'>    " + this.strName + int1 + LanResManager.getLanCommonTextWords("颗") + "," + "</font>";
         }
         if(this.goods2.count >= int2)
         {
            str += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + this.strName2 + int2 + LanResManager.getLanCommonTextWords("颗") + "<br></font>";
         }
         else
         {
            str += "<font color=\'" + StaticValue.RED_HTML + "\'>" + this.strName2 + int2 + LanResManager.getLanCommonTextWords("颗") + "<br></font>";
         }
         str += "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活成功几率：") + "<br></font>";
         str += "<font color=\'" + StaticValue.WHITE_HTML + "\'>    100%<br></font>";
         str += "</textformat>";
         this.ft1.htmlText = str;
      }
      
      public function setLongyinInitialize(param1:Goods, param2:int, param3:Goods, param4:int) : void
      {
         var str:String;
         var go:Goods = param1;
         var int1:int = param2;
         var go2:Goods = param3;
         var int2:int = param4;
         if(this.ft != null && this.ft.parent != null)
         {
            this.ft.parent.removeChildAt(0);
         }
         this.ft = new FTextArea();
         with(this.ft)
         {
            width = 400;
            height = 50;
            x = 15;
            y = 7;
            filters = StaticValue.filter;
            textColor = StaticValue.SKY_BLUE;
            htmlText = "<textformat leading=\'4\'>" + "<font color=\'" + StaticValue.GOLD_HTML + "\'>" + LanResManager.getLanCommonTextWords("龙吟本是上古邪兵之首，曾被封印与九幽之地。") + "<br></font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("后世奇人以千年龙骨熔炼后，残魂已醒，龙威初现。") + "<br></font>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("若能收集龙魂碎片与上古夜明珠，便可画龙点睛，彻底唤醒上古神物。") + "</font><br>" + "</textformat>";
         }
         this.sprite.addChild(this.ft);
         this.biaoshi = 2;
         this.setItem(2);
         this.strName = go.res.name;
         this.itemTextArr[0].htmlText = this.strName;
         this.goods = go;
         this.item = new ItemFace(go);
         this.item.x = 272 - 25;
         this.item.y = 122 + 15;
         addChild(this.item);
         if(go.count <= 0)
         {
            this.item.filters = Tools.blackWhiteFilter;
         }
         this.itemFaceArr.push(this.item);
         this.strName2 = go2.res.name;
         this.itemTextArr[1].htmlText = this.strName2;
         this.goods2 = go2;
         this.item2 = new ItemFace(go2);
         this.item2.x = 342 + 20 - 25;
         this.item2.y = 122 + 15;
         addChild(this.item2);
         if(go2.count <= 0)
         {
            this.item2.filters = Tools.blackWhiteFilter;
         }
         this.itemFaceArr.push(this.item2);
         str = "";
         str = "<textformat leading=\'6\'>";
         str += "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活条件：") + "<br></font>";
         str += "<font color=\'" + StaticValue.WHITE_HTML + "\'>    " + LanResManager.getLanCommonTextWords("拥有神兵【龙吟】") + "<br></font>";
         str += "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("隐藏属性激活后加成：") + "<br></font>";
         str += "<font color=\'" + StaticValue.WHITE_HTML + "\'>    " + LanResManager.getLanCommonTextWords("攻击血量青龙战纹(攻击增强)") + "<br></font>";
         str += "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活将消耗：") + "<br></font>";
         if(this.goods.count >= int1)
         {
            str += "<font color=\'" + StaticValue.GREEN_HTML + "\'>    " + this.strName + int1 + LanResManager.getLanCommonTextWords("颗") + "," + "</font>";
         }
         else
         {
            str += "<font color=\'" + StaticValue.RED_HTML + "\'>    " + this.strName + int1 + LanResManager.getLanCommonTextWords("颗") + "," + "</font>";
         }
         if(this.goods2.count >= int2)
         {
            str += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + this.strName2 + int2 + LanResManager.getLanCommonTextWords("颗") + "<br></font>";
         }
         else
         {
            str += "<font color=\'" + StaticValue.RED_HTML + "\'>" + this.strName2 + int2 + LanResManager.getLanCommonTextWords("颗") + "<br></font>";
         }
         str += "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活成功几率：") + "<br></font>";
         str += "<font color=\'" + StaticValue.WHITE_HTML + "\'>    100%<br></font>";
         str += "</textformat>";
         this.ft1.htmlText = str;
      }
      
      public function setLongyaInitialize(param1:Array, param2:Object, param3:String = "") : void
      {
         var i:int;
         var jiacheng:String;
         var count:int;
         var str:String;
         var j:int;
         var g:Goods = null;
         var item:ItemFace = null;
         var obj:Object = null;
         var dataArr:Array = param1;
         var zhuijia:Object = param2;
         var name:String = param3;
         if(this.ft != null && this.ft.parent != null)
         {
            this.ft.parent.removeChildAt(0);
         }
         this.ft = new FTextArea();
         with(this.ft)
         {
            width = 400;
            height = 50;
            x = 15;
            y = 7;
            filters = StaticValue.filter;
            textColor = StaticValue.SKY_BLUE;
            htmlText = "<textformat leading=\'4\'>" + "<font color=\'" + StaticValue.GOLD_HTML + "\'>" + LanResManager.getLanCommonTextWords("龙牙描述1") + "<br></font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("龙牙描述2") + "<br></font>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("龙牙描述3") + "</font><br>" + "</textformat>";
         }
         this.sprite.addChild(this.ft);
         this.biaoshi = 3;
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         if(dataArr.length > 3)
         {
            return;
         }
         this.setItem(dataArr.length);
         i = 0;
         while(i < dataArr.length)
         {
            g = dataArr[i].good as Goods;
            item = new ItemFace(g);
            item.x = (this.itemArr[i] as Bitmap).x + 2;
            item.y = 122 + 15;
            if(g.count <= 0)
            {
               item.filters = Tools.blackWhiteFilter;
            }
            this.itemTextArr[i].htmlText = g.res.name;
            addChild(item);
            this.itemFaceArr.push(item);
            i++;
         }
         jiacheng = "";
         count = 0;
         if(zhuijia.gongji != 0)
         {
            jiacheng += LanResManager.getLanCommonTextWords("攻击：") + zhuijia.gongji + ",";
            count++;
         }
         if(zhuijia.fangyu != 0)
         {
            jiacheng += LanResManager.getLanCommonTextWords("防御：") + zhuijia.fangyu + ",";
            count++;
         }
         if(zhuijia.baoji != 0)
         {
            jiacheng += LanResManager.getLanCommonTextWords("暴击：") + zhuijia.baoji;
            if(count == 2)
            {
               jiacheng += "<br>    ";
               count = 0;
            }
            else
            {
               jiacheng += ",";
               count++;
            }
         }
         if(zhuijia.shanbi != 0)
         {
            jiacheng += LanResManager.getLanCommonTextWords("闪避：") + zhuijia.shanbi;
            if(count == 2)
            {
               jiacheng += "<br>    ";
               count = 0;
            }
            else
            {
               jiacheng += ",";
               count++;
            }
         }
         if(zhuijia.shengming != 0)
         {
            jiacheng += LanResManager.getLanCommonTextWords("生命：") + zhuijia.shengming;
            if(count == 2)
            {
               jiacheng += "<br>    ";
               count = 0;
            }
            else
            {
               jiacheng += ",";
               count++;
            }
         }
         if(zhuijia.neili != 0)
         {
            jiacheng += LanResManager.getLanCommonTextWords("内力：") + zhuijia.neili;
            if(count == 2)
            {
               jiacheng += "<br>    ";
               count = 0;
            }
            else
            {
               jiacheng += ",";
               count++;
            }
         }
         if(zhuijia.tili != 0)
         {
            jiacheng += LanResManager.getLanCommonTextWords("体力：") + zhuijia.tili;
            if(count == 2)
            {
               jiacheng += "<br>    ";
               count = 0;
            }
            else
            {
               jiacheng += ",";
               count++;
            }
         }
         if(jiacheng.length != 0)
         {
            if(jiacheng.lastIndexOf("<br>    ") == jiacheng.length - 8)
            {
               jiacheng = jiacheng.substr(0,jiacheng.length - 8);
            }
            else
            {
               jiacheng = jiacheng.substr(0,jiacheng.length - 1);
            }
         }
         str = "";
         str = "<textformat leading=\'6\'>";
         str += "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活条件：") + "<br></font>";
         str += "<font color=\'" + StaticValue.WHITE_HTML + "\'>    " + LanResManager.getLanCommonTextWords("拥有神兵") + "【" + name + "】" + "<br></font>";
         str += "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("隐藏属性激活后加成：") + "<br></font>";
         str += "<font color=\'" + StaticValue.WHITE_HTML + "\'>    " + jiacheng + "<br></font>";
         str += "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活将消耗：") + "<br></font>";
         j = 0;
         while(j < dataArr.length)
         {
            obj = dataArr[j] as Object;
            if(obj.good.count >= obj.count)
            {
               str += "<font color=\'" + StaticValue.GREEN_HTML + "\'>    " + obj.good.res.name + obj.count + LanResManager.getLanCommonTextWords("颗");
            }
            else
            {
               str += "<font color=\'" + StaticValue.RED_HTML + "\'>    " + obj.good.res.name + obj.count + LanResManager.getLanCommonTextWords("颗");
            }
            if(j != dataArr.length - 1)
            {
               str += ",";
            }
            str += "</font>";
            j++;
         }
         str += "<br>";
         str += "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活成功几率：") + "<br></font>";
         str += "<font color=\'" + StaticValue.WHITE_HTML + "\'>    100%<br></font>";
         str += "</textformat>";
         this.ft1.htmlText = str;
      }
   }
}

