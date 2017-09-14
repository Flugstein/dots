#!/usr/bin/perl

# obmenu-generator - schema file

=for comment

    item:      add an item inside the menu               {item => ["command", "label", "icon"]},
    cat:       add a category inside the menu             {cat => ["name", "label", "icon"]},
    sep:       horizontal line separator                  {sep => undef}, {sep => "label"},
    pipe:      a pipe menu entry                         {pipe => ["command", "label", "icon"]},
    raw:       any valid Openbox XML string               {raw => q(xml string)},
    begin_cat: begin of a category                  {begin_cat => ["name", "icon"]},
    end_cat:   end of a category                      {end_cat => undef},
    obgenmenu: generic menu settings                {obgenmenu => ["label", "icon"]},
    exit:      default "Exit" action                     {exit => ["label", "icon"]},

=cut

# NOTE:
#    * Keys and values are case sensitive. Keep all keys lowercase.
#    * ICON can be a either a direct path to an icon or a valid icon name
#    * Category names are case insensitive. (X-XFCE and x_xfce are equivalent)

require "$ENV{HOME}/.config/obmenu-generator/config.pl";

## Text editor
my $editor = $CONFIG->{editor};

our $SCHEMA = [

	## Main    
    {item => ['pcmanfm',       							 'File Manager'		]},
    {item => ['urxvt',            						 'Terminal'			]},
    {item => ['firefox-beta-bin http://archlinux.org', 	 'Web Browser'		]},

    {sep => undef},

	#Music
	{item => ['deadbeef',		'Music']},

	## Game
	{begin_cat => ['Game']},
		{item => ['steam',			'Steam',      		'steam'				]},
		{item => ['teamspeak3',		'Team Speak 3',		'teamspeak3'		]},
	{end_cat => undef},

	## Download
	{begin_cat => ['Download']},
		{item => ['deluge',			'Deluge',      		'deluge'			]},
	{end_cat => undef},
	
	## Coding
	{begin_cat => ['Coding']},
		{item => ['gvim',			'Vim',      		'gvim'				]},
		{item => ['geany',			'Geany',			'geany'				]},
		{item => ['idea.sh',		'IntelliJ IDEA',	'idea.sh'			]},
	{end_cat => undef},

	## Office
	{begin_cat => ['Office']},
		{item => ['gnome-calculator',	'Calculator',      	'gnome-calculator'	]},
		{item => ['libreoffice',		'LibreOffice',      'libreoffice-writer']},
	{end_cat => undef},
	
	## Graphic
	{begin_cat => ['Graphic']},
		{item => ['pinta',			'Pinta',      		'pinta'				]},
		{item => ['gimp',			'GIMP',				'gimp'				]},	
	{end_cat => undef},

	## Cryptocoins
	{begin_cat => ['Cryptocoins']},
		{item => ['electrum',			'Electrum',      		'electrum'	]},
		{item => ['bisq',				'Bisq',					'bisq'	]},
		{item => ['multidoge',			'Multidoge',			'multidoge'	]},
		{item => ['mist',				'Ethereum Mist',		'mist'	]},
		{item => ['jaxx',				'Jaxx',					'jaxx'	]},	
	{end_cat => undef},

	## Chat
	{begin_cat => ['Chat']},
		{item => ['telegram-desktop',		'Telegram',      'telegram']},
		{item => ['discord',				'Discord',      'discord']},
	{end_cat => undef},

	## Config
	{begin_cat => ['Config']},
		{item => ['obconf', 							'Obconf'		]},
		{item => ['lxappearance', 						'GTK+'			]},
		{item => ["$editor ~/.conkyrc", 				'Conky RC'		]},
		{item => ["$editor ~/.config/tint2/tint2rc",	'Tint2 Panel'	]},

		# Openbox
		{begin_cat => ['Openbox']},
			{item => ["$editor ~/.config/obmenu-generator/schema.pl", 	'Obmenu Schema'		]},
			{item => ["$editor ~/.config/obmenu-generator/config.pl", 	'Obmenu Config'		]},
			{item => ["$editor ~/.config/openbox/autostart", 			'Openbox Autostart'	]},
			{item => ["$editor ~/.config/openbox/rc.xml", 				'Openbox RC'		]},
		{end_cat => undef},

	{end_cat => undef},


	{sep => undef},


	## All catagory
    {begin_cat => ['All']},
		{cat => ['utility',     'Accessories', 'applications-utilities']},
		{cat => ['development', 'Development', 'applications-development']},
		{cat => ['education',   'Education',   'applications-science']},
		{cat => ['game',        'Games',       'applications-games']},
		{cat => ['graphics',    'Graphics',    'applications-graphics']},
		{cat => ['audiovideo',  'Multimedia',  'applications-multimedia']},
		{cat => ['network',     'Network',     'applications-internet']},
		{cat => ['office',      'Office',      'applications-office']},
		{cat => ['other',       'Other',       'applications-other']},
		{cat => ['settings',    'Settings',    'applications-accessories']},
		{cat => ['system',      'System',      'applications-system']},	
    {end_cat   => undef},
	
    # This option uses the default Openbox's action "Exit"
    {exit => ['Exit']},
    {item => ['poweroff', 'Poweroff']},
    
]
