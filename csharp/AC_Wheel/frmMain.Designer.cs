namespace AC_Wheel
{
    partial class frmMain
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose( bool disposing )
        {
            if ( disposing && ( components != null ) )
            {
                components.Dispose();
            }
            base.Dispose( disposing );
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.chkPlayer1 = new System.Windows.Forms.CheckBox();
            this.chkPlayer2 = new System.Windows.Forms.CheckBox();
            this.btnSendBriefJolt = new System.Windows.Forms.Button();
            this.btnSendVeryBriefJolt = new System.Windows.Forms.Button();
            this.btnSendLowRumble = new System.Windows.Forms.Button();
            this.btnSendHardRumble = new System.Windows.Forms.Button();
            this.timerDisplay = new System.Windows.Forms.Timer(this.components);
            this.label1 = new System.Windows.Forms.Label();
            this.checkBox1 = new System.Windows.Forms.CheckBox();
            this.btnSendStretch = new System.Windows.Forms.Button();
            this.progressBarX0 = new System.Windows.Forms.ProgressBar();
            this.progressBarX1 = new System.Windows.Forms.ProgressBar();
            this.progressBarDX = new System.Windows.Forms.ProgressBar();
            this.timerForceFeedback = new System.Windows.Forms.Timer(this.components);
            this.SuspendLayout();
            // 
            // chkPlayer1
            // 
            this.chkPlayer1.AutoSize = true;
            this.chkPlayer1.Checked = true;
            this.chkPlayer1.CheckState = System.Windows.Forms.CheckState.Checked;
            this.chkPlayer1.Location = new System.Drawing.Point(195, 12);
            this.chkPlayer1.Name = "chkPlayer1";
            this.chkPlayer1.Size = new System.Drawing.Size(108, 17);
            this.chkPlayer1.TabIndex = 0;
            this.chkPlayer1.Text = "Send To Player 1";
            this.chkPlayer1.UseVisualStyleBackColor = true;
            // 
            // chkPlayer2
            // 
            this.chkPlayer2.AutoSize = true;
            this.chkPlayer2.Checked = true;
            this.chkPlayer2.CheckState = System.Windows.Forms.CheckState.Checked;
            this.chkPlayer2.Location = new System.Drawing.Point(362, 12);
            this.chkPlayer2.Name = "chkPlayer2";
            this.chkPlayer2.Size = new System.Drawing.Size(108, 17);
            this.chkPlayer2.TabIndex = 1;
            this.chkPlayer2.Text = "Send To Player 2";
            this.chkPlayer2.UseVisualStyleBackColor = true;
            // 
            // btnSendBriefJolt
            // 
            this.btnSendBriefJolt.Location = new System.Drawing.Point(3, 35);
            this.btnSendBriefJolt.Name = "btnSendBriefJolt";
            this.btnSendBriefJolt.Size = new System.Drawing.Size(117, 23);
            this.btnSendBriefJolt.TabIndex = 2;
            this.btnSendBriefJolt.Text = "Send Brief Jolt";
            this.btnSendBriefJolt.UseVisualStyleBackColor = true;
            this.btnSendBriefJolt.Click += new System.EventHandler(this.btnSendBriefJolt_Click);
            // 
            // btnSendVeryBriefJolt
            // 
            this.btnSendVeryBriefJolt.Location = new System.Drawing.Point(3, 64);
            this.btnSendVeryBriefJolt.Name = "btnSendVeryBriefJolt";
            this.btnSendVeryBriefJolt.Size = new System.Drawing.Size(117, 23);
            this.btnSendVeryBriefJolt.TabIndex = 3;
            this.btnSendVeryBriefJolt.Text = "Send Very Brief Jolt";
            this.btnSendVeryBriefJolt.UseVisualStyleBackColor = true;
            this.btnSendVeryBriefJolt.Click += new System.EventHandler(this.btnSendVeryBriefJolt_Click);
            // 
            // btnSendLowRumble
            // 
            this.btnSendLowRumble.Location = new System.Drawing.Point(3, 93);
            this.btnSendLowRumble.Name = "btnSendLowRumble";
            this.btnSendLowRumble.Size = new System.Drawing.Size(117, 23);
            this.btnSendLowRumble.TabIndex = 4;
            this.btnSendLowRumble.Text = "Send Low Rumble";
            this.btnSendLowRumble.UseVisualStyleBackColor = true;
            this.btnSendLowRumble.Click += new System.EventHandler(this.btnSendLowRumble_Click);
            // 
            // btnSendHardRumble
            // 
            this.btnSendHardRumble.Location = new System.Drawing.Point(3, 122);
            this.btnSendHardRumble.Name = "btnSendHardRumble";
            this.btnSendHardRumble.Size = new System.Drawing.Size(117, 23);
            this.btnSendHardRumble.TabIndex = 5;
            this.btnSendHardRumble.Text = "Send Hard Rumble";
            this.btnSendHardRumble.UseVisualStyleBackColor = true;
            this.btnSendHardRumble.Click += new System.EventHandler(this.btnSendHardRumble_Click);
            // 
            // timerDisplay
            // 
            this.timerDisplay.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(156, 35);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(35, 13);
            this.label1.TabIndex = 6;
            this.label1.Text = "label1";
            // 
            // checkBox1
            // 
            this.checkBox1.AutoSize = true;
            this.checkBox1.Location = new System.Drawing.Point(12, 12);
            this.checkBox1.Name = "checkBox1";
            this.checkBox1.Size = new System.Drawing.Size(60, 17);
            this.checkBox1.TabIndex = 7;
            this.checkBox1.Text = "TIMER";
            this.checkBox1.UseVisualStyleBackColor = true;
            // 
            // btnSendStretch
            // 
            this.btnSendStretch.Location = new System.Drawing.Point(3, 154);
            this.btnSendStretch.Name = "btnSendStretch";
            this.btnSendStretch.Size = new System.Drawing.Size(117, 23);
            this.btnSendStretch.TabIndex = 8;
            this.btnSendStretch.Text = "Send Stretch";
            this.btnSendStretch.UseVisualStyleBackColor = true;
            this.btnSendStretch.Click += new System.EventHandler(this.btnSendStretch_Click);
            // 
            // progressBarX0
            // 
            this.progressBarX0.Location = new System.Drawing.Point(159, 93);
            this.progressBarX0.Name = "progressBarX0";
            this.progressBarX0.Size = new System.Drawing.Size(311, 23);
            this.progressBarX0.TabIndex = 10;
            // 
            // progressBarX1
            // 
            this.progressBarX1.Location = new System.Drawing.Point(159, 122);
            this.progressBarX1.Name = "progressBarX1";
            this.progressBarX1.Size = new System.Drawing.Size(311, 23);
            this.progressBarX1.TabIndex = 11;
            // 
            // progressBarDX
            // 
            this.progressBarDX.Location = new System.Drawing.Point(159, 154);
            this.progressBarDX.Name = "progressBarDX";
            this.progressBarDX.Size = new System.Drawing.Size(311, 23);
            this.progressBarDX.TabIndex = 12;
            // 
            // timerForceFeedback
            // 
            this.timerForceFeedback.Enabled = true;
            this.timerForceFeedback.Interval = 200;
            this.timerForceFeedback.Tick += new System.EventHandler(this.timerFF_Tick);
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(482, 297);
            this.Controls.Add(this.progressBarDX);
            this.Controls.Add(this.progressBarX1);
            this.Controls.Add(this.progressBarX0);
            this.Controls.Add(this.btnSendStretch);
            this.Controls.Add(this.checkBox1);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnSendHardRumble);
            this.Controls.Add(this.btnSendLowRumble);
            this.Controls.Add(this.btnSendVeryBriefJolt);
            this.Controls.Add(this.btnSendBriefJolt);
            this.Controls.Add(this.chkPlayer2);
            this.Controls.Add(this.chkPlayer1);
            this.Name = "frmMain";
            this.Text = "AC_Wheel";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.CheckBox chkPlayer1;
        private System.Windows.Forms.CheckBox chkPlayer2;
        private System.Windows.Forms.Button btnSendBriefJolt;
        private System.Windows.Forms.Button btnSendVeryBriefJolt;
        private System.Windows.Forms.Button btnSendLowRumble;
        private System.Windows.Forms.Button btnSendHardRumble;
        private System.Windows.Forms.Timer timerDisplay;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.CheckBox checkBox1;
        private System.Windows.Forms.Button btnSendStretch;
        private System.Windows.Forms.ProgressBar progressBarX0;
        private System.Windows.Forms.ProgressBar progressBarX1;
        private System.Windows.Forms.ProgressBar progressBarDX;
        private System.Windows.Forms.Timer timerForceFeedback;
    }
}

