# Ultroid - UserBot
# Copyright (C) 2021-2022 TeamUltroid
# This file is a part of < https://github.com/TeamUltroid/Ultroid/ >
# PLease read the GNU Affero General Public License in <https://www.github.com/TeamUltroid/Ultroid/blob/main/LICENSE/>.

FROM rendyprojects/python:latest

# set timezone
ENV TZ=Asia/Kolkata

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    # cloning the repo and installing requirements.
    &&pip install --upgrade pip
    && git clone https://github.com/Samidaites2/Ultro.git /root/Samidaites2/ \
    && pip3 install --no-cache-dir -r root/Samidaites2/requirements.txt \
    && pip3 install av --no-binary av

RUN pip3 install --no-cache-dir -r https://raw.githubusercontent.com/Samidaites2/Ultroid/main/resources/startup/optional-requirements.txt
# Railway's banned dependency
RUN if [ ! $RAILWAY_STATIC_URL ]; then pip3 install --no-cache-dir yt-dlp; fi

# changing workdir
WORKDIR /root/Samidaites2/

# start the bot
CMD ["bash", "startup"]
