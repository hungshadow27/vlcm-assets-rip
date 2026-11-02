package com.tgame.moudels.jiangshanshejishizhixinxi.controller
{
   import com.tgame.moudels.jiangshanshejishizhixinxi.view.JiangShangSheJiShiZHiXinXI_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class JiangShangSheJiShiZHiXinXI_StartupCommand extends SimpleCommand
   {
      
      public function JiangShangSheJiShiZHiXinXI_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerMediator(new JiangShangSheJiShiZHiXinXI_Mediator());
      }
   }
}

